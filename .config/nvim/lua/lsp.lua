-- Setup LSP integration

local pid = vim.fn.getpid()
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp = require 'lspconfig'

lsp.omnisharp.setup {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
    cmd = { "omnisharp", "--languageserver" , "--hostPID", tostring(pid) };
}

lsp.rust_analyzer.setup { capabilities = capabilities }
