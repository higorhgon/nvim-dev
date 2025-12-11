-----------------------------------------
---           LSP                     ---
-----------------------------------------
require("mason").setup({})

require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSPs
		"bash-language-server",
		"css-lsp",
		"html-lsp",
		"intelephense",
		"lua-language-server",
		"prettier",
		"tailwindcss-language-server",
		"typescript-language-server",
		-- Formatters and linters
		"blade-formatter",
		"phpcs",
		"php-cs-fixer",
		"rustywind",
		"shfmt",
		"sleek",
		"stylua",
	},
	auto_update = true,
})

-- Fix para obter as Globais do Neovim e não haver erros arquivos de configuração .lua
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.lsp.enable({
	"intelephense",
	"ts_ls",
	"html",
	"cssls",
	"tailwindcss",
	"lua_ls",
	"bashls",
})

require("conform").setup({
	notify_on_error = true,
	formatters_by_ft = {
		lua = {
			"stylua",
			lsp_format = "fallback",
		},
		bash = { "shfmt" },
		nix = { "nixfmt" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		javascript = {
			"prettier",
			lsp_format = "fallback",
			stop_after_first = true,
		},
		json = { "prettier" },
		jsonc = { "prettier" },
		sql = { "sleek" },
		blade = {
			"blade-formatter",
			"rustywind",
		},
		php = {
			"php_cs_fixer",
			-- lsp_format = "fallback",
			-- stop_after_first = true,
		},
	},
	formatters = {
		prettier = {
			command = "prettier",
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--print-width",
				"120",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		},
		-- Configuração do PHP CS Fixer (opcional)
		php_cs_fixer = {
			command = "php-cs-fixer",
			args = {
				"fix",
				"--rules=@PSR12",
				"$FILENAME",
			},
			stdin = false,
		},
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
