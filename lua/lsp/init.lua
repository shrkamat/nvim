local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- require "lsp.installer"
-- require("lsp.handlers").setup()
--require "user.lsp.null-ls"

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

vim.diagnostic.config({
  virtual_text = true,
})

lsp.setup_servers({'clangd', 'lua_ls', 'gopls'})

lsp.nvim_workspace()

lsp.setup()
