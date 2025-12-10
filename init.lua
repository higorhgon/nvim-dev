-----------------------------------------
---           OPTIONS                 ---
-----------------------------------------
-- Indent Opts
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.winborder = "rounded"
vim.opt.fillchars = {
	eob = " ",
}

-- Line Numbers Opts
vim.opt.relativenumber = true
vim.opt.number = true

-- Clipboard Opts
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = "osc52"

-- Folding Opts
vim.opt.foldenable = true
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Map Leader Key
vim.g.mapleader = " "

vim.diagnostic.config({ virtual_lines = false })

-----------------------------------------
---           PACKAGES                ---
-----------------------------------------
vim.pack.add({
	"https://github.com/catppuccin/nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.clue",
	"https://github.com/nvim-mini/mini.cmdline",
	"https://github.com/nvim-mini/mini.completion",
	"https://github.com/nvim-mini/mini.cursorword",
	"https://github.com/nvim-mini/mini.files",
	"https://github.com/nvim-mini/mini.hipatterns",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.indentscope",
	"https://github.com/nvim-mini/mini.jump2d",
	"https://github.com/nvim-mini/mini.move",
	"https://github.com/nvim-mini/mini.notify",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.pick",
	"https://github.com/nvim-mini/mini.splitjoin",
	"https://github.com/nvim-mini/mini.statusline",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.tabline",
})

-----------------------------------------
---           MINI PLUGINS            ---
-----------------------------------------
require("mini.ai").setup({})
local miniclue = require("mini.clue")
require("mini.clue").setup({
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	clues = {
		{ mode = "n", keys = "<leader>b", desc = "+Buffer" },
		{ mode = "n", keys = "<leader>c", desc = "+Code" },
		{ mode = "n", keys = "<leader>f", desc = "+Find" },
		{ mode = "n", keys = "<leader>s", desc = "+Search" },

		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},

	window = {
		delay = 100,
	},
})
require("mini.cmdline").setup({})
require("mini.completion").setup({})
require("mini.cursorword").setup({})
require("mini.files").setup({})
require("mini.hipatterns").setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})
require("mini.icons").setup({})
require("mini.indentscope").setup({
	draw = {
		delay = 0,
	},
	options = {
		indent_at_cursor = true,
	},
	symbol = "▏",
})
vim.api.nvim_set_hl(0, "MiniJump2dSpotUnique", {
	bg = "#f9e2af",
	fg = "#11111b",
})
require("mini.jump2d").setup({
	labels = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	view = {
		dim = true,
		n_steps_ahead = 2,
	},
})
require("mini.move").setup({
	mappings = {
		-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
		left = "<M-h>",
		right = "<M-l>",
		down = "<M-j>",
		up = "<M-k>",

		-- Move current line in Normal mode
		line_left = "",
		line_right = "",
		line_down = "",
		line_up = "",
	},
})
require("mini.notify").setup({})
require("mini.pairs").setup({})
require("mini.pick").setup({
	window = {
		config = function()
			-- Calculate height and width as a Golden Ratio fraction of screen size
			local height = math.floor(0.618 * vim.o.lines)
			local width = math.floor(0.618 * vim.o.columns)

			return {
				anchor = "NW",
				height = height,
				width = width,
				-- Calculate row and col to center the window
				row = math.floor(0.5 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
				-- You can add other nvim_open_win options here, e.g., 'border'
				border = "rounded",
			}
		end,
	},
})
require("mini.splitjoin").setup({})
require("mini.statusline").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})

-----------------------------------------
---           COLORSCHEME             ---
-----------------------------------------
vim.cmd.colorscheme("catppuccin")

-----------------------------------------
---           TREESITTER              ---
-----------------------------------------
local ts_parsers = {
	"bash",
	"css",
	"dockerfile",
	"fish",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"python",
	"php",
	"php_only",
	"phpdoc",
	"scss",
	"sql",
	"yaml",
}

require("nvim-treesitter.configs").setup({
	ensure_installed = ts_parsers,
	auto_install = true,
	sync_install = false,
	ignore_install = {},
	modules = {},
	indent = {
		enable = true,
	},
	injections = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function()
		vim.cmd("TSUpdate")
	end,
})

require("treesitter-context").setup({
	max_lines = 3,
	multiline_threshold = 1,
	min_window_height = 20,
	line_numbers = true,
})

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
		-- "nixfmt",
		"phpcs",
		"php-cs-fixer",
		"rustywind",
		"shfmt",
		"sleek",
		"stylua",
	},
	auto_update = true,
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

-- Fix para obter as Globais do Neovim e não haver erros arquivos de configura .lua
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.lsp.config("intelephense", {
	settings = {
		intelephense = {
			format = {
				enable = false, -- Desabilita formatação do Intelephense
			},
		},
	},
	on_attach = function(client)
		-- Desabilita capacidades de formatação do LSP
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
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
			lsp_format = "fallback",
			stop_after_first = true,
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
})
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

-----------------------------------------
---           KEYMAPS                 ---
-----------------------------------------
vim.keymap.set(
	"n",
	"<Leader>e",
	":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
	{ desc = "Explore Buffer Dir" }
)
vim.keymap.set("n", "<Leader>E", ":lua MiniFiles.open()<CR>", { desc = "Explore CWD" })
vim.keymap.set("n", "<Leader>ff", ":Pick files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<Leader>fh", ":Pick help<CR>", { desc = "Find Help" })
vim.keymap.set("n", "<Leader>fb", ":Pick buffers<CR>", { desc = "Find Buffers" })
vim.keymap.set("n", "<Leader>sg", ":Pick grep<CR>", { desc = "Search Grep" })
vim.keymap.set(
	{ "o", "x", "n" },
	"<Cr>",
	"<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>",
	{ desc = "Jump anywhere" }
)
vim.keymap.set("n", "<C-S-i>", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Code Format" })
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Code Format" })
vim.keymap.set("n", "grf", vim.lsp.buf.format, { desc = "vim.lsp.buf.format()" })
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { desc = "Previous Buffer" })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = "Next Buffer" })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Buffer Delete" })

-----------------------------------------
---           AUTOCMD                 ---
-----------------------------------------
-- Keymap para inserir tags PHP sem problema
vim.api.nvim_create_autocmd("FileType", {
	pattern = "php",
	callback = function()
		vim.keymap.set("i", "<?php", "<?php", { buffer = true, silent = true })
		vim.keymap.set("i", "<?=", "<?=", { buffer = true, silent = true })
	end,
})

-- Show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

-- Adjust the delay before CursorHold triggers (default is 4000ms)
vim.opt.updatetime = 250 -- 250ms delay
