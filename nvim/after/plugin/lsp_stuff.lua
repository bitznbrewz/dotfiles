vim.lsp.set_log_level("off")
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
    'pyright',
    'marksman',
    'rust_analyzer',
    'astro'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>']     = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>']     = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>']     = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    mapping = cmp_mappings
})

lsp.setup()
