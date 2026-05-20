return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		-- We'll use pcall (protected call) to avoid the 'module not found' error
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			-- Install these languages automatically
			ensure_installed = {
				"lua",
				"python",
				"javascript",
				"html",
				"css",
				"markdown",
				"bash",
				"vim",
				"vimdoc",
			},
			-- List of parsers to ignore installing
			ignore_install = {},
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			auto_install = true,
			highlight = {
				enable = true, -- Enable syntax highlighting
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}
