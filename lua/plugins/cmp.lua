-- Plugin manager: install nvim-cmp, LuaSnip, cmp_luasnip, and cmp-nvim-lsp
return {
    'hrsh7th/nvim-cmp',
    version = false, -- Ignore tags because nvim-cmp has a very old tag
    dependencies = {
        'L3MON4D3/LuaSnip',         -- Snippet engine
        'saadparwaiz1/cmp_luasnip', -- Snippet engine adapter
        'hrsh7th/cmp-nvim-lsp',     -- Source for LSP completion
    },
    config = function(_, opts)
        -- init.lua: setup nvim-cmp
        require'cmp'.setup({
            snippet = {
                -- Exclusive to LuaSnip, check nvim-cmp documentation for usage with a different snippet engine
                expand = function(args)
                    require'luasnip'.lsp_expand(args.body)
                end
            },
            mapping = {
                -- Sample but necessary mappings, read nvim-cmp documentation to customize them
                ['<C-c>'] = require'cmp'.mapping.abort(),
                ['<CR>'] = require'cmp'.mapping.confirm(),
                ['<C-n>'] = require'cmp'.mapping.select_next_item(),
                ['<C-p>'] = require'cmp'.mapping.select_prev_item(),
            },
            sources = {
                { name = 'nvim_lsp' },
            },
        })
    end,
}
