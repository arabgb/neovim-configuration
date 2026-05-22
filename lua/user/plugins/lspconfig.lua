return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- Automatic tool installation
        "j-hui/fidget.nvim",                         -- LSP progress notifications
        "folke/neodev.nvim",                         -- Lua development support
        "hrsh7th/cmp-nvim-lsp",                      -- LSP completion source
    },
    config = function()
        -- Initialize Neodev for Neovim Lua API autocompletion
        -- Must be called before lspconfig
        require("neodev").setup({})

        -- Initialize Fidget for visual LSP status updates
        require("fidget").setup({})

        -- Define base capabilities for nvim-cmp integration
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        if status_ok then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        end

        -- Initialize Mason for binary management
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",                   -- Lua LSP
                "basedpyright",             -- Python LSP
                "ts_ls",                    -- TypeScript/JavaScript LSP
                "ruff",                     -- for python linting and formatting
            },
            automatic_installation = false, -- Only install what's listed above
        })

        -- Automatically install LSPs, Formatters, and Linters
        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua",   -- Lua Formatter
                "prettier", -- JS/TS/CSS/HTML Formatter
                "black",    -- Python Formatter
            },
        })

        -- Modern Server Configurations (Neovim 0.11+ style)

        -- JavaScript / TypeScript Configuration
        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
            settings = {
                javascript = {
                    suggest = { completeFunctionCalls = true }, -- Enable parameter hints
                },
                typescript = {
                    suggest = { completeFunctionCalls = true },
                },
            },
        })

        -- Python Configuration (Basedpyright)
        vim.lsp.config("basedpyright", {
            capabilities = capabilities,
            settings = {
                basedpyright = {
                    analysis = {
                        -- "off" completely disables basedpyright's own diagnostic publishing
                        typeCheckingMode = "off",
                        diagnosticMode = "openFilesOnly",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        })

        -- Python Configuration (Ruff for high-priority diagnostics and sorting)
        vim.lsp.config("ruff", {
            capabilities = capabilities,
            settings = {
                lint = {
                    -- Limit warnings strictly to logic errors, vital PEP8, and basic anomalies
                    select = { "E", "F", "W" },
                    ignore = { "E501", "E741" }, -- Ignore long line boundaries and single-character names
                },
            },
        })

        -- Lua Configuration
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } }, -- Suppress "undefined global vim" warning
                    workspace = { checkThirdParty = false },
                },
            },
        })

        -- Explicitly enable the configured servers
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("basedpyright")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("ruff")

        -- Add these diagnostic configuration options
        vim.diagnostic.config({
            -- Show virtual text next to line (displays error message)
            virtual_text = {
                prefix = "●", -- Custom icon
                spacing = 1,
                source = false,
            },
            -- Show signs in the sign column (E, W, etc.)
            signs = true,
            -- Show floating window when cursor is on error
            update_in_insert = false,
            -- Underline the error
            underline = true,
            -- Show severity icons
            severity_sort = true,
            -- Floating window options
            float = {
                border = "rounded",
                source = false, -- Show source (e.g., pyright)
                header = "Diagnostic",
            },
        })

        -- Keybindings (Triggered when an LSP attaches to a buffer)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)           -- Go to definition
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- Show hover info
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- Smart rename
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostic popup

                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client == nil then
                    return
                end
                if client.name == 'ruff' then
                    -- Disable hover in favor of Pyright
                    client.server_capabilities.hoverProvider = false
                end
            end,
            desc = 'LSP: Disable hover capability from Ruff',
        })
    end,
}
