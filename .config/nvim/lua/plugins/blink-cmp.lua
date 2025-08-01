return {
    {
        'ricardoramirezr/blade-nav.nvim',
        dependencies = {         -- totally optional
            'saghen/blink.cmp',  -- if using blink.cmp
        },
        ft = { 'blade', 'php' }, -- optional, improves startup time
    },
    {
        'saghen/blink.compat',
        -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
        version = '*',
        -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
        lazy = true,
        -- make sure to set opts so that lazy.nvim calls blink.compat's setup
        opts = {},
    },
    {
        'saghen/blink.cmp',
        event = { 'InsertEnter', 'VeryLazy' },
        lazy = true,
        -- optional: provides snippets for the snippet source
        dependencies = {
            'rafamadriz/friendly-snippets',
            {
                'L3MON4D3/LuaSnip',
                version = 'v2.*',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                    config = function()
                        -- Adiciona extended snippets para PHP
                        require("luasnip").filetype_extend(
                            "php",
                            {
                                "html",
                                -- "css",
                                -- "javascript",
                            }
                        )
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
                config = function()
                    -- Adiciona o diretório de snippets personalizados
                    require("luasnip.loaders.from_vscode").lazy_load({
                        paths = {
                            vim.fn.stdpath 'config' .. '/snippets'
                        }
                    })
                end,
            },
        },

        -- use a release tag to download pre-built binaries
        version = "*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = "cargo build --release",

        opts = {
            keymap = {
                -- 'default' for mappings similar to built-in completion
                -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
                -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
                preset = 'none',

                ['<C-Space>'] = {
                    function(cmp) cmp.show({ providers = { 'snippets' } }) end
                },

                -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'hide' },
                ['<C-y>'] = { 'select_and_accept' },

                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

                -- ['<Tab>'] = { 'snippet_forward', 'fallback' },
                -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                ['<C-h>'] = { 'snippet_backward', 'fallback' },
                ['<C-l>'] = { 'snippet_forward', 'fallback' },

                ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },


                ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
                ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
                ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
                ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
                ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
                ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
                ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
                ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
                ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
                ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
            },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                use_nvim_cmp_as_default = true,
                kind_icons = {
                    Copilot = ' ',
                    Text = '󰉿 ',
                    Method = '󰊕 ',
                    Function = '󰊕 ',
                    Constructor = '󰒓 ',

                    Field = "󰜢 ",
                    Variable = "󰆦 ",
                    Property = "󰖷 ",

                    Class = "󱡠 ",
                    Interface = "󱡠 ",
                    Struct = "󱡠 ",
                    Module = "󰅩 ",

                    Unit = "󰪚 ",
                    Value = "󰦨 ",
                    Enum = "󰦨 ",
                    EnumMember = "󰦨 ",

                    Keyword = "󰻾 ",
                    Constant = "󰏿 ",

                    Snippet = "󱄽 ",
                    Color = "󰏘 ",
                    File = "󰈔 ",
                    Reference = "󰬲 ",
                    Folder = "󰉋 ",
                    Event = "󱐋 ",
                    Operator = "󰪚 ",
                    TypeParameter = "󰬛 ",
                },
            },

            sources = {
                default = function(ctx)
                    local success, node = pcall(vim.treesitter.get_node)
                    if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
                        return { 'buffer' }
                    else
                        return {
                            'lsp',
                            'path',
                            'snippets',
                            'buffer',
                        }
                    end
                end,
                per_filetype = {
                    blade = {
                        'lsp',
                        'path',
                        'snippets',
                        'buffer',
                        'blade-nav'
                    },
                },
                providers = {
                    ['blade-nav'] = {
                        name = "Blade-nav",
                        module = "blade-nav.blink",
                        score_offset = -3,
                        opts = {
                            close_tag_on_complete = true,
                        }
                    },
                    path = {
                        opts = {
                            get_cwd = function(_)
                                return vim.fn.getcwd()
                            end,
                            show_hidden_files_by_default = true,
                        }
                    },
                    buffer = {
                        opts = {
                            get_bufnrs = function()
                                return vim.tbl_filter(function(bufnr)
                                    return vim.bo[bufnr].buftype == ''
                                end, vim.api.nvim_list_bufs())
                            end
                        }
                    },
                    snippets = {
                        -- should_show_items = function(ctx)
                        --     return ctx.trigger.initial_kind == 'trigger_character'
                        -- end
                        -- opts = {
                        --     friendly_snippets = true,
                        --     extended_filetypes = {
                        --         php = {
                        --             "html",
                        --             -- "css",
                        --             -- "javascript"
                        --         },
                        --     },
                        -- },
                    },
                    cmdline = {
                        min_keyword_length = function(ctx)
                            -- when typing a command, only show when the keyword is 3 characters or longer
                            if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then return 3 end
                            return 0
                        end
                    }
                }
            },

            cmdline = {
                sources = function()
                    local type = vim.fn.getcmdtype()
                    if type == "/" or type == "?" then
                        return { "buffer" }
                    end
                    if type == ":" then
                        return { "cmdline" }
                    end
                    return {}
                end,
                completion = {
                    -- menu = {
                    --     auto_show = true
                    -- },
                    ghost_text = {
                        enabled = true,
                    }
                },
            },

            snippets = {
                preset = "luasnip",
                -- -- Function to use when expanding LSP provided snippets
                -- expand = function(snippet) require("luasnip").lsp_expand(snippet) end,
                -- -- Function to use when checking if a snippet is active
                -- active = function(filter) return require("luasnip").jumpable(filter) end,
                -- -- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
                -- jump = function(direction) require("luasnip").jump(direction) end,
            },

            completion = {
                accept = {
                    auto_brackets = {
                        -- Whether to auto-insert brackets for functions
                        enabled = true,
                    },
                },
                menu = {
                    border = "rounded",
                    draw = {
                        treesitter = { "lsp" },
                        -- columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
                        columns = {
                            { 'item_idx' },
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind",              gap = 1 },
                        },
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                -- text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
                                text = function(ctx)
                                    local icon = ctx.kind_icon

                                    if ctx.source_name == 'Blade-nav' then
                                        icon = ''
                                    end

                                    return ' ' .. icon .. ctx.icon_gap .. ' '
                                end,
                                -- If you do not want the custom highlight color you can delete this
                                highlight = function(ctx)
                                    local hl = 'BlinkCmpKind' .. ctx.kind

                                    if ctx.source_name == 'Blade-nav' then
                                        hl = 'BlinkCmpKindBladeNav'
                                    end

                                    return hl
                                end,
                            },
                            item_idx = {
                                text = function(ctx)
                                    return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or
                                        tostring(ctx.idx)
                                end,
                                highlight = 'BlinkCmpItemIdx' -- optional, only if you want to change its color
                            }
                        },
                    },
                },
                documentation = {
                    window = {
                        border = "single",
                    },
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },

                -- Display a preview of the selected item on the current line
                -- ghost_text = { enabled = true },
            },

            signature = {
                enabled = true,
                window = {
                    border = "rounded",
                },
            },
        },
        opts_extend = {
            "sources.default"
        }
    },
}
