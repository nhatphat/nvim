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
