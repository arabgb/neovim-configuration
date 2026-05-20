return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Required for file and folder icons
	},
	config = function()
		local nvimtree = require("nvim-tree")
		-- Disable netrw (default file explorer) at the start
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		-- Setup for nvim-web-devicons
		require("nvim-web-devicons").setup({
			default = true,
		})
		-- Define the light gray color for the arrows/indent markers
		-- You can adjust #808080 to #a0a0a0 if you want it even lighter
		vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#808080" })
		vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#abb2bf", bold = true })
		-- Setup for nvim-tree
		nvimtree.setup({
			-- Render options for icons and layout
			renderer = {
				highlight_opened_files = "all",
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
			-- Window options
			view = {
				width = 35,
				side = "left",
			},
		})

		-- Keybinding to toggle the file explorer (Leader + e)
		vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", {
			silent = true,
			desc = "Toggle Nvim-Tree Explorer",
		})
	end,
}
