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
                "pyright",                  -- Python LSP
                "ts_ls",                    -- TypeScript/JavaScript LSP
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

        -- Python Configuration
        vim.lsp.config("pyright", {
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = { completeFunctionParens = true }, -- Auto-add parens for functions
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
        vim.lsp.enable("pyright")
        vim.lsp.enable("lua_ls")

        -- Keybindings (Triggered when an LSP attaches to a buffer)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)           -- Go to definition
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- Show hover info
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- Smart rename
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- Show diagnostic popup
            end,
        })
    end,
}
