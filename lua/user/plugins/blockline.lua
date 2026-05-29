-- Ensure comments remain in English for clear config maintenance
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	-- The config function allows us to run custom Lua code during initialization
	config = function()
		-- 1. Create a bulletproof custom color definition that forces the line to be dim gray
		-- We place this inside a ColorScheme autocommand so it reapplies even if you switch themes
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				-- Force the active block scope to a muted, dark charcoal gray
				vim.api.nvim_set_hl(0, "MyCustomSubtleScope", { fg = "#3f444a", nocombine = true })

				-- Keep non-active background lines deeply faded and out of the way
				vim.api.nvim_set_hl(0, "IblIndent", { fg = "#22242b", nocombine = true })
			end,
		})

		-- Manually execute it once right now in case the theme loaded before this file
		vim.api.nvim_set_hl(0, "MyCustomSubtleScope", { fg = "#3f444a", nocombine = true })
		vim.api.nvim_set_hl(0, "IblIndent", { fg = "#22242b", nocombine = true })

		-- 2. Run the actual plugin setup with your layout preferences
		require("ibl").setup({
			indent = {
				char = "│",
			},
			scope = {
				enabled = true,
				show_start = true,
				show_end = true,
				-- Direct the plugin to look exclusively at our unified color rule
				highlight = { "MyCustomSubtleScope" },
			},
		})
	end,
}
