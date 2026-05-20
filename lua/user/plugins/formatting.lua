return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" }, -- isort sorts imports, black fixes spacing
				javascript = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettier" },
				css = { "prettier" },
			},
			-- Formatting on save
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		-- Shortcut to format manually with Space + mp (Format Pass)
		vim.keymap.set({ "n", "v" }, "<leader>fa", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
