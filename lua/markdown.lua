
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Glow
keymap("n", "<C-R>", ":Glow", opts)
