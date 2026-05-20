return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Import comment plugin safely
		local comment = require("Comment")

		-- Enable comment with default settings
		comment.setup()

		-- Set keymaps for CTRL + /
		-- In many terminals, CTRL + / is recognized as CTRL + _
		local keymap = vim.keymap

		-- Normal Mode: Toggle single line comment
		keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Comment line with CTRL + /" })
		keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment line with CTRL + /" })

		-- Visual Mode: Toggle selection comment
		keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Comment selection with CTRL + /" })
		keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comment selection with CTRL + /" })
	end,
}
