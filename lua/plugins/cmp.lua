local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
	completion = {
		completeopt = 'menu,menuone,preview',
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<S-Tab>'] = cmp.mapping.select_prev_item(), --prev suggestion
		['<Tab>'] = cmp.mapping.select_next_item(), --next suggestion
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(), --show recomendations
		['<C-e>'] = cmp.mapping.abort(), --close recomendatiosn
		['<CR>'] = cmp.mapping.confirm({ select = true }), --confirm selection
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }, --lsp
		{ name = 'luasnip' }, --snippets
		{ name = 'buffer' }, --text in current buffer
		{ name = 'path' }, --file system paths
	}),
})
