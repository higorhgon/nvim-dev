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
require("mini.files").setup({
	windows = {
		preview = true,
		width_focus = 30,
		width_preview = 30,
	},
})
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
		animation = require("mini.indentscope").gen_animation.none(),
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
