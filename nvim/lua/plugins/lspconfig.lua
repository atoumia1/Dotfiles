return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local lspconfig = require("lspconfig") -- Import lspconfig

        -- Set up nvim-cmp
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
            {
                { name = 'buffer' },
            })
        })

        -- Extend LSP capabilities with nvim-cmp
        local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- Set up Mason and Mason LSPconfig
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pylsp",
            },
            handlers = {
                function(server_name)
                    -- Set up each language server dynamically
                    lspconfig[server_name].setup {
                        capabilities = capabilities
                    }
                end
            }
        })

        -- Custom handler for lua_ls (Lua Language Server)
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        }

        -- Diagnostic settings
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}

