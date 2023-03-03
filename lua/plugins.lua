local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
    use "sainnhe/gruvbox-material"
    use "machakann/vim-highlightedyank"

    -- LSP - ZERO
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },                -- Required
            { 'rafamadriz/friendly-snippets' },    -- Optional
            { 'benfowler/telescope-luasnip.nvim' } -- TODO recheck
        }
    }

    use { "nvim-treesitter/nvim-treesitter", run = "TSUpdate" }
    use { "simrat39/rust-tools.nvim" }

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use { 'axkirillov/easypick.nvim', requires = 'nvim-telescope/telescope.nvim' }
    use "kyazdani42/nvim-web-devicons"

    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"

    -- Static analysis
    use 'jose-elias-alvarez/null-ls.nvim'

    -- git
    use "lewis6991/gitsigns.nvim"

    -- TableMode
    use "dhruvasagar/vim-table-mode"

    -- Markdown previewer
    use "ellisonleao/glow.nvim"
    use "mhinz/vim-startify"

    -- build tools
    use 'stevearc/dressing.nvim'
    use "mfussenegger/nvim-dap"
    use "Shatur/neovim-cmake"
    use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- bufferline
    use "akinsho/bufferline.nvim"

    -- terminal handling
    use "akinsho/toggleterm.nvim"

    -- pomodoro
    use 'nvim-lualine/lualine.nvim'
    use {
        'wthollingsworth/pomodoro.nvim',
        requires = 'MunifTanjim/nui.nvim',
    }

    -- plantuml
    use 'aklt/plantuml-syntax'
    use 'tyru/open-browser.vim'
    use 'weirongxu/plantuml-previewer.vim'

    -- terraform
    use 'hashivim/vim-terraform'

    -- search
    use 'voldikss/vim-browser-search'

    -- wiki
    use 'vimwiki/vimwiki'
    use 'ElPiloto/telescope-vimwiki.nvim'

    -- tree explorer
    use 'kyazdani42/nvim-tree.lua'

    -- profile
    use 'dstein64/vim-startuptime'

    -- easy align
    use 'junegunn/vim-easy-align'

    -- lazygit
    use 'kdheepak/lazygit.nvim'

    -- be good, learn vim
    use 'ThePrimeagen/vim-be-good'


    use({ "shrkamat/telescope-csearch", requires = { { "nvim-telescope/telescope.nvim" } } })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
