require("options")
require("plugins")
require("lsp")
require("config.telescope")
require("config.toggleterm")
require("config.pomodoro")
require("config.luasnip")
require("config.rust-tools")
require("keymaps") -- maintain this last ?

vim.cmd "colorscheme gruvbox-material"
vim.cmd "highlight HighlightedyankRegion cterm=reverse gui=reverse" -- updated highlightedyank color
vim.cmd "set cursorline"
vim.cmd "set encoding=UTF-8"
vim.cmd "set nocompatible"
vim.cmd "set mmp=5000"

-- set vimwiki configs
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.cmd [[ let g:vimwiki_list = [{'path': '~/Documents/Wiki/', 'syntax': 'markdown', 'ext': '.md'}] ]]
else
    vim.cmd [[ let g:vimwiki_list = [{'path': '~/Wiki/', 'syntax': 'markdown', 'ext': '.md'}] ]]
end

-- Glow binary for windows (placed in same dir as nvim)
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.g.glow_binary_path = "c:\\Neovim\\bin"
end

-- simple setup(s) that won't have any customizations
require("config.gitsigns")
require("nvim-autopairs").setup()
require("Comment").setup()

require("bufferline").setup {}

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

require 'nvim-tree'.setup {}

-- require("flutter-tools").setup{decorations = {
--     outline = {
--     open_cmd = "20vnew",
--     auto_open = false
-- }}}

-- alternatively you can override the default configs
require("flutter-tools").setup {
    ui = {
        -- the border type to use for all floating windows, the same options/formats
        -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
        border = "rounded",
        -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
        -- please note that this option is eventually going to be deprecated and users will need to
        -- depend on plugins like `nvim-notify` instead.
        -- notification_style = 'native' | 'plugin'
    },
    decorations = {
        statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = false,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = false,
        }
    },
    flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
    fvm = false,              -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
    widget_guides = {
        enabled = false,
    },
    closing_tags = {
        -- highlight = "ErrorMsg", -- highlight for the closing tag
        -- prefix = ">", -- character to use for close tag e.g. > Widget
        enabled = true -- set to false to disable
    },
    dev_log = {
        enabled = false,
        open_cmd = "tabedit", -- command to use to open the log buffer
    },
    dev_tools = {
        autostart = false,         -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
    },
    outline = {
        open_cmd = "20vnew", -- command to use to open the outline buffer
        auto_open = false    -- if true this will open the outline automatically when it is first populated
    },
    lsp = {
        color = {
            -- show the derived colours for dart variables
            enabled = false,    -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = false, -- highlight the background
            foreground = false, -- highlight the foreground
            -- virtual_text = true, -- show the highlight using virtual text
            -- virtual_text_str = "■", -- the virtual text character to highlight
        },
        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
            analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
        }
    }
}

local easypick = require("easypick")

local base_branch = "master"

-- feature is currently unusable
easypick.setup({
    pickers = {
        {
            name = "gdiff",
            command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
            previewer = easypick.previewers.branch_diff({ base_branch = base_branch })
        },
    }
})

vim.api.nvim_create_user_command(
    "ResSearch",
    ":Telescope resume",
    {}
)

vim.api.nvim_create_user_command(
    "FFCodeSearch",
    ':lua require("telescope.builtin").find_files({ find_command = { "csearch", "-l", "." } })',
    {}
)

vim.api.nvim_create_user_command(
    "FFTelescope",
    ':Telescope find_files',
    {}
)
