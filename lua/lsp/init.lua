local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- require "lsp.installer"
-- require("lsp.handlers").setup()
--require "user.lsp.null-ls"

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = { omit = { '<F2>', '<F4>' } },
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }
    local bind = vim.keymap.set

    bind('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    bind('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    -- more keybindings...
end)


vim.diagnostic.config({
    virtual_text = true,
})

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
    'clangd',
    'lua_ls',
    'gopls',
    'jsonls',
    'lua_ls'
})


lsp.setup_servers({ 'clangd', 'lua_ls', 'gopls', 'jq-lsp', 'json-lsp' })

lsp.nvim_workspace()

lsp.setup()
