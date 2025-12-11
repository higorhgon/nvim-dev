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
vim.keymap.set("n", "<Leader>fg", ":Pick files tool='git'<CR>", { desc = "Find Files GIT" })
vim.keymap.set("n", "<Leader>fh", ":Pick help<CR>", { desc = "Find Help" })
vim.keymap.set("n", "<Leader>fb", ":Pick buffers<CR>", { desc = "Find Buffers" })
vim.keymap.set("n", "<Leader>sg", ":Pick grep_live<CR>", { desc = "Search Grep" })
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
