local Path = require('plenary.path')

require("cmake").setup({
    parameters_file = 'neovim.json',
    build_dir = tostring(Path:new('{cwd}', 'build')),
    -- samples_path = tostring(script_path:parent():parent():parent() / 'samples'),
    default_projects_path = tostring(Path:new(vim.loop.os_homedir(), 'Projects')),
    configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-D', 'CMAKE_PREFIX_PATH=build/deps/staging' },
    quickfix_height = 10,
})

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- cmake build and execute
keymap("n", "<C-R>", ":wa <CR> :CMake build_and_run <CR>", opts)
keymap("i", "<C-R>", "<ESC> :wa <CR> :CMake build_and_run <CR>", opts)
keymap("v", "<C-R>", "<ESC> :wa <CR> :CMake build_and_run <CR>", opts)
