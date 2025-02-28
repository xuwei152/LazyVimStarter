-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


local map = vim.keymap.set
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:set autochdir<CR><ESC>:w<CR>', { noremap = true, silent = true })
-- Scroll down by 3 lines
vim.api.nvim_set_keymap('n', '<C-d>', '6<C-e>', { noremap = true, silent = true })
-- Scroll up by 3 lines
vim.api.nvim_set_keymap('n', '<C-u>', '6<C-y>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '+', '3<C-w>+', { noremap = true, silent = true }) -- Increase height of window by 3 lines
vim.api.nvim_set_keymap('n', '_', '3<C-w>-', { noremap = true, silent = true }) -- Decrease height of window by 3 lines
vim.api.nvim_set_keymap('n', '=', '9<C-w>>', { noremap = true, silent = true }) -- Increase width of window by 9 columns
vim.api.nvim_set_keymap('n', '-', '9<C-w><', { noremap = true, silent = true }) -- Decrease width of window by 9 columns

