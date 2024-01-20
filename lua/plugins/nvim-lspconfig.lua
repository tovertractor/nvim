local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
	opts.buffer = bufnr

	opts.desc = 'Show lsp references'
	vim.kemap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

	opts.desc = 'goto declation'
	vim.kemap.set('n', 'gD', vim.lsp.buf.declation, opts)

	opts.desc = 'show lsp definitions'
	vim.kemap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

	opts.desc = 'show lsp implementations'
	vim.kemap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

	opts.desc = 'Show lsp type definitions'
	vim.kemap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

	opts.desc = 'see available code actions'
	vim.kemap.set({ 'n', 'v'}, '<leader>ca', vim.lsp.buf.code_actions, opts)

	opts.desc = 'smart rename'
	vim.kemap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

	opts.desc = 'show buffer diagnostics'
	vim.kemap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

	opts.desc = 'show line diagnostics'
	vim.kemap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

	opts.desc = 'go to previous diagnostic'
	vim.kemap.set('n', '[d', vim.diagnostic.goto_prev, opts)

	opts.desc = 'go to next diagnostic'
	vim.kemap.set('n', ']d', vim.diagnostic.goto_next, opts)

	opts.desc = 'show documentation for what is under cursor'
	vim.kemap.set('n', 'K', vim.lsp.buf.hover, opts)

	opts.desc = 'restart lsp'
	vim.kemap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local signs = { Error = 'X', Warn = '!', Hint = '?', Info = 'i' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

lspconfig['html'].setup({
	capabilities = capabilities,
	on_attach = on_attach
})

lspconfig['cssls'].setup({
	capabilities = capabilities,
	on_attach = on_attach
})

lspconfig['clangd'].setup({
	capabilities = capabilities,
	on_attach = on_attach
})

lspconfig['lua_ls'].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				},
			},
		},
	},
})
