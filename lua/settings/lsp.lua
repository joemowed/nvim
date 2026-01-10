local lsp = require("lsp-zero")

local luasnip = require("luasnip")

-- Fix Undefined global 'vim'

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else
                fallback()
            end
        end),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'snippy' }, -- For snippy users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
    }, {
        { name = 'buffer' },
    })
})


--lsp.set_preferences({
--    suggest_lsp_servers = true,
--    sign_icons = {
--       error = 'E',
--      warn = 'W',
--     hint = 'H',
--    info = 'I'
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>GD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vs", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
lsp.setup()
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

vim.lsp.config.clangd={
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--query-driver=/usr/bin/arm-none-eabi-**",
        "--header-insertion=never"
    },
}
vim.lsp.config.cssls =  {
    settings = {
        css = {
            validate = true,
            lint = {
                unknownAtRules = "ignore"
            }
        },
        scss = {
            validate = true,
            lint = {
                unknownAtRules = "ignore"
            }
        },
        less = {
            validate = true,
            lint = {
                unknownAtRules = "ignore"
            }
        },
    },
}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()

)
--neocmake autocomplete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config.neocmake={
    capabilities = capabilities,
}

-- Create group to assign commands
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.css", "*.html", "*.ts" },
    desc = "Format CSS and HTML on save",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !prettier -w " .. fileName)
    end,
    group = autocmd_group,
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.py" },
    desc = "Format python on save",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !black " .. fileName)
    end,
    group = autocmd_group,
})
