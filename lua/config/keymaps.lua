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

-- map \ to behave like Ctrl+o (jump to previous location)
vim.keymap.set("n", "\\", "<C-o>", { silent = true, desc = "Jump to previous location" })

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
