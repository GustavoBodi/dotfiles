local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

keymap("n", "gd", "<Cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<cr>", opts)

keymap('n', '<A-i>', ":ToggleTerm<CR>", opts)
keymap('t', '<A-i>', "<Cmd>ToggleTerm<CR>", opts)
keymap("n", "ff", ":Telescope find_files<cr>", opts)
keymap("n", "fg", ":Telescope live_grep<cr>", opts)
keymap("n", "fb", ":Telescope file_browser<cr>", opts)
keymap("n", "fh", ":Telescope help_tags<cr>", opts)

--keymap("n", "<C-b>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<C-q>", ":bdelete! <cr>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

vim.api.nvim_create_user_command("Compile", "!./compile.sh", {})
vim.api.nvim_create_user_command("Doc", "!doc", {})
