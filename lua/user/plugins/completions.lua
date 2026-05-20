return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
		"hrsh7th/cmp-path", -- Path source for nvim-cmp
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
		"windwp/nvim-autopairs", -- Auto-close parens and integrate with cmp
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Integration with autopairs
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Optional: Load VSCode style snippets (e.g. from friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- This handles the parameters jumping
				end,
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- Show suggestions
				["<C-e>"] = cmp.mapping.abort(), -- Close menu

				-- Confirm with Enter
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),

				-- Tab: Jump to next parameter OR select next suggestion
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }), -- "i" = insert, "s" = select mode (crucial for snippets)

				-- S-Tab: Jump to previous parameter
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				-- 1. Priority 0: Development support for Neovim (if using lazydev/neodev)
				{ name = "lazydev", group_index = 0 },

				-- 2. Main sources
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 },

				-- 3. Helpful UI additions
				{ name = "nvim_lsp_signature_help" }, -- Shows params as you type

				-- 4. General sources
				{ name = "path", priority = 500 },
				{ name = "buffer", priority = 250 },
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
