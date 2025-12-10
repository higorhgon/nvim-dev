require("config.options")
require("config.pack")
require("config.colorscheme")

-- Dynamically load all plugin configurations from the "plugins" directory
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.readdir(plugins_dir, [[v:val =~ '\.lua$']])) do
    local plugin_path = "plugins." .. file:gsub("%.lua$", "")
    pcall(require, plugin_path)
end

require("config.keymaps")
require("config.autocmds")
