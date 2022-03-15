require("options")
require("plugins")
require("completion")
require("lsp")
require("tscope")
require("config.toggleterm")
require("config.pomodoro")
require("config.luasnip")
require("keymaps")    -- maintain this last ?

vim.cmd "colorscheme gruvbox-material"
vim.cmd "highlight HighlightedyankRegion cterm=reverse gui=reverse"       -- updated highlightedyank color
vim.cmd "set cursorline"
vim.cmd "set encoding=UTF-8"
vim.cmd "set nocompatible"

-- set vimwiki configs
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.cmd [[ let g:vimwiki_list = [{'path': '~/Documents/Wiki/', 'syntax': 'markdown', 'ext': '.md'}] ]]
else
  vim.cmd [[ let g:vimwiki_list = [{'path': '~/Wiki/', 'syntax': 'markdown', 'ext': '.md'}] ]]
end

-- Glow binary for windows (placed in same dir as nvim)
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.g.glow_binary_path="c:\\Neovim\\bin"
end

-- simple setup(s) that won't have any customizations
require("config.gitsigns")
require("nvim-autopairs").setup()
require("Comment").setup()

require("bufferline").setup{}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = { "utf-16" }
-- require("lspconfig").clangd.setup({ capabilities = capabilities })

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
null_ls.setup {
  debug = true,
  sources = {
    formatting.clang_format,
    formatting.cmake_format,
  },
}

