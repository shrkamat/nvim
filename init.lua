require("options")
require("plugins")
require("completion")
require("lsp")
require("tscope")
require("config.toggleterm")
require("config.pomodoro")
require("config.neorg")
require("keymaps")    -- maintain this last ?


vim.cmd "colorscheme gruvbox-material"
vim.cmd "highlight HighlightedyankRegion cterm=reverse gui=reverse"       -- updated highlightedyank color
vim.cmd "set cursorline"
vim.cmd "set encoding=UTF-8"
vim.cmd "set nocompatible"
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.g.glow_binary_path="c:\\Neovim\\bin"
end

-- simple setup(s) that won't have any customizations
require("gitsigns").setup()
require("nvim-autopairs").setup()
require("Comment").setup()
require("cmake")
require("bufferline").setup{}
require("nvim-treesitter.configs").setup{
   ensure_installed = { "norg", "norg_meta", "norg_table", "rust", "cpp", "c", "javascript", "markdown" }, 
   highlight = {
       enable = true
   }
}

