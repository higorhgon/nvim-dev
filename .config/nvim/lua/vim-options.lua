-- Indent Opts
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Line Numbers Opts
vim.opt.number = true

-- Clipboard Opts
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
    name = "OSC 52",
    -- On Linux and Windows use + register, on macOS use * register
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    },
    paste = {
        ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    },
}

-- Folding Opts
vim.opt.foldenable = true
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
