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
		additional_vim_regex_highlighting = {
			"php",
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<M-o>",
			node_incremental = "<M-o>",
			scope_incremental = "<M-O>",
			node_decremental = "<M-i>",
		},
	},
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function()
		vim.cmd("TSUpdate")
	end,
})

require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
		-- ["html"] = {},
	},
})

require("treesitter-context").setup({
	max_lines = 3,
	multiline_threshold = 1,
	min_window_height = 20,
	line_numbers = true,
})
