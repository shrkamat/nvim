
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- python3 
keymap("n", "<C-R>", ":!python3 %<CR>", opts)
