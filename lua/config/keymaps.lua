-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- map ctr + , to toggle comment mode instead of gcc
vim.keymap.set("n", "<C-,>", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-,>", "gc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("i", "<C-,>", "<Esc>gcca", { remap = true, silent = true, desc = "Toggle comment" })

-- map cmd + s to save all files
vim.keymap.set("n", "<D-s>", "<cmd>wall<CR>", { silent = true, desc = "Save all files" })
vim.keymap.set("i", "<D-s>", "<Esc><cmd>wall<CR>a", { silent = true, desc = "Save all files" })
vim.keymap.set("v", "<D-s>", "<Esc><cmd>wall<CR>gv", { silent = true, desc = "Save all files" })

-- map Delete to behave like Ctrl+o (jump to previous location)
vim.keymap.set("n", "<BS>", "<C-o>", { silent = true, desc = "Jump to previous location" })

-- Terminal keymaps - Ctrl+/ to toggle terminal at cwd (like LazyVim's <leader>fT)
vim.keymap.set("n", "<C-/>", function()
  Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
end, { desc = "Terminal (cwd)" })

vim.keymap.set("i", "<C-/>", function()
  vim.cmd("stopinsert")
  Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
end, { desc = "Terminal (cwd)" })

vim.keymap.set("v", "<C-/>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  Snacks.terminal(nil, { cwd = vim.fn.getcwd() })
end, { desc = "Terminal (cwd)" })

vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- ==============================================================
-- SMART ENTER KEY FOR LSP: gd -> gr fallback
-- ==============================================================
-- Function to show definitions, with automatic fallback to references if no definitions found
-- Uses Snacks picker with on_close callback for automatic fallback
-- Note: If you're at a definition and want to see references, use `gr` manually
local function smart_lsp_goto()
  Snacks.picker.lsp_definitions({
    on_close = function(picker)
      -- If picker had no results (empty), automatically show references
      if picker:empty() then
        vim.schedule(function()
          Snacks.picker.lsp_references()
        end)
      end
    end,
  })
end

-- Set up Enter key mapping when LSP attaches to buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_smart_enter", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    -- Normal mode: Enter to smart goto
    vim.keymap.set("n", "<CR>", smart_lsp_goto, { buffer = bufnr, silent = true, desc = "LSP: Smart goto (gd->gr)" })
    -- Visual mode: Escape visual mode, then smart goto
    vim.keymap.set("v", "<CR>", function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
      smart_lsp_goto()
    end, { buffer = bufnr, silent = true, desc = "LSP: Smart goto (gd->gr)" })
    -- Shift+Enter: go to implementation
    vim.keymap.set("n", "<M-CR>", function()
      Snacks.picker.lsp_implementations()
    end, { buffer = bufnr, silent = true, desc = "LSP: Go to implementation" })
    vim.keymap.set("v", "<M-CR>", function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
      Snacks.picker.lsp_implementations()
    end, { buffer = bufnr, silent = true, desc = "LSP: Go to implementation" })
  end,
})

vim.keymap.set("n", "<leader>hh", function()
  Snacks.terminal(
    [[
    if git diff --quiet && [ -z "$(git ls-files --others --exclude-standard --directory | head -n 1)" ]; then
      hunk diff --staged
    else
      hunk diff
    fi
  ]],
    {
      win = {
        position = "float",
        width = 0.98,
        height = 0.98,
        border = "rounded",
      },
    }
  )
end, {
  desc = "hunk diff/staged",
})

vim.keymap.set("n", "<leader>hd", function()
  Snacks.terminal("hunk diff", {
    win = {
      position = "float",
      width = 0.98,
      height = 0.98,
      border = "rounded",
    },
  })
end, {
  desc = "hunk diff",
})

vim.keymap.set("n", "<leader>hH", function()
  Snacks.terminal("hunk diff --staged", {
    win = {
      position = "float",
      width = 0.98,
      height = 0.98,
      border = "rounded",
    },
  })
end, {
  desc = "hunk staged",
})

vim.keymap.set("n", "<leader>hs", function()
  Snacks.terminal("hunk show", {
    win = {
      position = "float",
      width = 0.98,
      height = 0.98,
      border = "rounded",
    },
  })
end, {
  desc = "hunk show",
})
