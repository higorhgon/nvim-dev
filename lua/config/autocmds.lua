-----------------------------------------
---           AUTOCMDS                ---
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
