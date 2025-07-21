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

-- Verifica se está em uma sessão SSH
local is_ssh_session = os.getenv("SSH_CONNECTION") ~= nil or os.getenv("SSH_CLIENT") ~= nil

if is_ssh_session then
    vim.g.clipboard = {
        name = "OSC 52",
        -- No Linux e Windows use o registrador +, no macOS use o registrador *
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*")
        },
        paste = {
            ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
            ["*"] = require("vim.ui.clipboard.osc52").paste("*")
        },
    }
end

-- Folding Opts
vim.opt.foldenable = true
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
