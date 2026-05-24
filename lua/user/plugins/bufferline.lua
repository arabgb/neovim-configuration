return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "buffers", -- show open buffers in the tabline
				separator_style = "thin", -- can be "heavy", "thin", "slant", etc.
				always_show_bufferline = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				-- Matches our nvim-tree icons
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
		})

		-- Keymaps for switching between tabs/buffers
		local keymap = vim.keymap
		keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		keymap.set("n", "<leader>b]", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
		keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
		keymap.set("n", "<leader>b[", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })

		-- Keymap for closing the current buffer
		-- keymap.set("n", "<leader>bx", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
	end,
}
