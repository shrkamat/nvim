local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap("n", "<C-A>", "ggVG", opts)              -- select all
keymap("n", "U", "<C-R>", opts)                 -- redo, this feels a bit more natural

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press kj fast to enter
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- Telescope key maps (is this the right file ?)
keymap("n", "<F7>", ":Telescope lsp_document_symbols <CR>", opts)
keymap("n", "<F8>", ":Telescope lsp_workspace_symbols <CR>", opts)
keymap("n", "", ":Telescope lsp_references <CR>", opts)
keymap("n", "=", ":Telescope lsp_definitions <CR>", opts)
keymap("n", "-", "<C-o>", opts)
keymap("n", "_", "<C-i>", opts)

keymap("n", "<leader>oo", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>ls", ":Telescope buffers <CR>", opts)
keymap("n", "<leader>gs", ":Telescope git_status <CR>", opts)
keymap("n", "<leader>gg", ":Telescope grep_string <CR>", opts)
keymap("n", "<F9>", ":Telescope live_grep <CR>", opts)
keymap("n", "<leader>d", ":Telescope diagnostics bufnr=0 <CR>", opts)
keymap("n", "<leader>D", ":Telescope diagnostics <CR>", opts)

-- startify
vim.g.startify_change_to_vcs_root=1

-- cmake build and execute
-- TODO should move this to ftplugin (cpp/c) projects
keymap("n", "<C-R>", ":wa <CR> :CMake build_and_run <CR>", opts)
keymap("i", "<C-R>", "<ESC> :wa <CR> :CMake build_and_run <CR>", opts)
keymap("v", "<C-R>", "<ESC> :wa <CR> :CMake build_and_run <CR>", opts)

-- save
keymap("n", "<C-S>", ":update <CR>", opts)
keymap("v", "<C-S>", "<ESC> :update <CR>", opts)
keymap("i", "<C-S>", "<ESC> :update <CR>", opts)

-- search
keymap("n", "G", ":BrowserSearch<CR>", opts)
keymap("v", "G", ":BrowserSearch<CR>", opts)
keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts)

-- https://stackoverflow.com/questions/5559029/quickly-switching-buffers-in-vim-normal-mode
keymap("n", "<tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>", opts)
keymap("n", "<S-tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>", opts)

-- word Navigate
keymap("n", "b", "W", opts)
