-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.env.SSH_TTY or vim.env.SSH_CONNECTION or vim.env.REX_SESSION then
  local osc52_copy = require("vim.ui.clipboard.osc52").copy("+")

  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      if vim.v.event.operator == "y" then
        osc52_copy(vim.v.event.regcontents)
      end
    end,
  })
end
