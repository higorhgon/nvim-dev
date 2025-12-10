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
