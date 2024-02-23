local lspconfig = require("lspconfig")

return { lspconfig.pyright.setup({
	filetype = { "python" },
	init_options = {
		plugins = {
			pyflakes = { enabled = true },
			mypy = { enabled = true },
			pydocstyle = { enabled = true },
			ruff = { enabled = true },
		},
	},

}) }
