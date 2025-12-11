require("config.options")
require("config.pack")
require("config.colorscheme")

-- Dynamically load all plugin configurations from the "plugins" directory
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local all_files = vim.fn.readdir(plugins_dir)

for _, file in ipairs(all_files) do
    if file:match("%.lua$") then
        local plugin_name = file:gsub("%.lua$", "")
        pcall(require, "plugins." .. plugin_name)
    end
end

require("config.keymaps")
require("config.autocmds")
