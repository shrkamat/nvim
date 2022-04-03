local Path = require('plenary.path')

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- cmake build and execute
keymap("n", "<C-R>", ":wa <CR> :RustRun <CR>", opts)
keymap("i", "<C-R>", "<ESC> :wa <CR> :RustRun <CR>", opts)
keymap("v", "<C-R>", "<ESC> :wa <CR> :RustRun <CR>", opts)
