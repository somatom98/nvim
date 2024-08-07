-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Base
map("i", "jk", "<ESC>", opts)

-- Indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Line moving
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Resize screen
map("n", "<C-S-k>", ":resize -2<CR>", opts)
map("n", "<C-S-j>", ":resize +2<CR>", opts)
map("n", "<C-S-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-S-l>", ":vertical resize +2<CR>", opts)

-- Lsp
map("n", "gb", "<C-o>", opts)

-- Neo tree
map("n", "<leader>e", ":Neotree reveal<CR>", opts)
map("n", "<leader>E", ":Neotree close<CR>", opts)
