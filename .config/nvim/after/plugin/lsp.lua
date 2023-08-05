local lsp = require('lsp-zero')

lsp.preset({})

lsp.ensure_installed({
    'tailwindcss',
    'pyright',
    'marksman',
    'jsonls',
    'html',
    'emmet_ls',
    'cssls',
    'clangd',
    'bashls',
    'astro',
    'eslint',
    'lua_ls',
    'tsserver'
})

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

------------------------
--- EMMET LSP CONFIG ---
------------------------
lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "astro", "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})

------------------------
---- LUA LSP CONFIG ----
------------------------
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.texlab.setup({})

lsp.setup()

-------------------------
---- NVIM CMP CONFIG ----
-------------------------
local cmp = require('cmp')

local cmp_mappings = {
    ['<C-Space>'] = cmp.mapping.complete()
}

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }
    }, {
        { name = 'buffer' },
        { name = 'path' }
    }),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp_mappings,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    }
})
