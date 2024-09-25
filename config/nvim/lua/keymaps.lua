local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ","

-- Find tree
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

-- Buffer
keymap("n", "<Leader>c", ":bd<CR>", opts)
keymap("n", "H", ":bprev<CR>", opts)
keymap("n", "L", ":bnext<CR>", opts)

-- Clean serch highlight
keymap("n", "<leader><space>", ":noh<CR>", opts)

-- Split window
keymap("n", "<Leader>h", ":<C-u>split<CR>", opts)
keymap("n", "<Leader>v", ":<C-u>vsplit<CR>", opts)

-- Escape
keymap("i", "jj", "<ESC>", opts)

-- Command key
keymap("n", ";", ":")
keymap("n", ":", ";")

-- Switch window
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

-- Step
keymap("n", "<C-j>", "3j", opts)
keymap("n", "<C-k>", "3k", opts)

-- Packer
keymap("n", "PI", ":PackerInstall<CR>")
keymap("n", "PS", ":PackerSync<CR>")
keymap("n", "PC", ":PackerCompile<CR>")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap("n", "<leader>fb", ":Telescope buffers<CR>")
keymap("n", "<leader>fh", ":Telescope find_files<CR>")

