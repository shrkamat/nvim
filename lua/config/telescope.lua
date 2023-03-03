local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

-- telescope.load_extension('media_files')
telescope.load_extension('vimwiki')
-- telescope.load_extension('cmake')
telescope.load_extension('luasnip')
telescope.load_extension('lazygit')
telescope.load_extension("csearch")

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        layout_config = {
            prompt_position = "top",
            height = 0.90,
            width = 0.96
        },
        preview = {
            timeout = 5000,
        },
        sorting_strategy = "ascending",
        mappings = {
            i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-c>"] = actions.close,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,
                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["<C-l>"] = actions.complete_tag,
                    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },
            n = {
                    ["<esc>"] = actions.close,
                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,
                    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,
                    ["<Down>"] = actions.move_selection_next,
                    ["<Up>"] = actions.move_selection_previous,
                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,
                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,
                    ["<PageUp>"] = actions.results_scrolling_up,
                    ["<PageDown>"] = actions.results_scrolling_down,
                    ["?"] = actions.which_key,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg" -- find command (defaults to `fd`)
        },
        command_palette = {
            { "Telescope",
                { 'resume', "lua require('telescope.builtin').resume()", 1 },
            },
            { "File",
                { "entire selection (C-a)",  ':call feedkeys("GVgg")' },
                { "save current file (C-s)", ':w' },
                { "save all files (C-A-s)",  ':wa' },
                { "quit (C-q)",              ':qa' },
                { "file browser (C-i)",      ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
                { "search word (A-w)",       ":lua require('telescope.builtin').live_grep()",                  1 },
                { "git files (A-f)",         ":lua require('telescope.builtin').git_files()",                  1 },
                { "files (C-f)",             ":lua require('telescope.builtin').find_files()",                 1 },
            },
            { "Help",
                { "tips",            ":help tips" },
                { "cheatsheet",      ":help index" },
                { "tutorial",        ":help tutor" },
                { "summary",         ":help summary" },
                { "quick reference", ":help quickref" },
                { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
            },
            { "Vim",
                { "reload vimrc",              ":source $MYVIMRC" },
                { 'check health',              ":checkhealth" },
                { "jumps (Alt-j)",             ":lua require('telescope.builtin').jumplist()" },
                { "commands",                  ":lua require('telescope.builtin').commands()" },
                { "command history",           ":lua require('telescope.builtin').command_history()" },
                { "registers (A-e)",           ":lua require('telescope.builtin').registers()" },
                { "colorshceme",               ":lua require('telescope.builtin').colorscheme()",    1 },
                { "vim options",               ":lua require('telescope.builtin').vim_options()" },
                { "keymaps",                   ":lua require('telescope.builtin').keymaps()" },
                { "buffers",                   ":Telescope buffers" },
                { "search history (C-h)",      ":lua require('telescope.builtin').search_history()" },
                { "paste mode",                ':set paste!' },
                { 'cursor line',               ':set cursorline!' },
                { 'cursor column',             ':set cursorcolumn!' },
                { "spell checker",             ':set spell!' },
                { "relative number",           ':set relativenumber!' },
                { "search highlighting (F12)", ':set hlsearch!' },
            }
        }
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
}

telescope.load_extension("command_palette")

local M = {}

function M.live_grep_nvim_configs()
    local opts = {}
    opts.search_dirs = { '~/.config/nvim' }
    opts.prompt_prefix = ' -> '
    opts.prompt_title = ' Search NeoVim Configs '
    opts.shorten_path = true
    return require('telescope.builtin').live_grep(opts)
end

return M
