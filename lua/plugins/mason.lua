local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
	ui = {
		icons = {
			package_installed = '✓',
			package_pending = '>',
			package_uninstalled = 'x',
		}
	}
})

mason_lspconfig.setup({
	ensure_installed = {
		
	},
	automatic_installation = true,
})
