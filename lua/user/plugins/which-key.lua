return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- Load when needed to keep startup fast
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300 -- Delay before the popup appears (in ms)
	end,
	config = function()
		local wk = require("which-key")

		-- Basic configuration
		wk.setup({
			-- Your custom configurations here (optional)
			plugins = {
				marks = true, -- shows a list of your marks
				registers = true, -- shows your registers
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
		})

		-- Optional: Register group names for a cleaner UI
		wk.add({
			{ "<leader>f", group = "Find (Telescope)" },
			{ "<leader>e", desc = "File Explorer" },
		})
	end,
}
