vim.o.number = true

require('packer-plugins')

require("nvim-tree").setup()
require("telescope").setup()
-- omnisharp lsp config
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/local/bin/omnisharp/OmniSharp"
require'lspconfig'.omnisharp.setup{
	cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) }
}
-- autocomplete config
local cmp = require 'cmp'
cmp.setup {
	mapping = {
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		})
	},
	sources = {
		{ name = 'nvim_lsp' },
	}
}

-- MAPPINGS ----------------------------------------------------------------------------------------
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap

-- Base
map("i", "jk", "<ESC>", opts)

-- Indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Line moving
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Split window
-- Movement
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Reisze
map("n", "<S-Up>", ":resize -2<CR>", opts)
map("n", "<S-Down>", ":resize +2<CR>", opts)
map("n", "<S-Left>", ":vertical resize -2<CR>", opts)
map("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Nvim Tree
map("n", "t", ":NvimTreeToggle<CR>", opts)

-- Barbar
-- Move to previous/next
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Close buffer
map('n', '-', '<Cmd>BufferClose<CR>', opts)
-- BufferPick
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- Telescope
map('n', 'ff', '<Cmd>Telescope find_files<CR>', opts) 
map('n', 'fg', '<Cmd>Telescope live_grep<CR>', opts) 
map('n', 'fb', '<Cmd>Telescope buffers<CR>', opts) 
map('n', 'fh', '<Cmd>Telescope help_tags<CR>', opts) 
