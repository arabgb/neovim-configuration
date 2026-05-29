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

		-- Normal Mode: Toggle single line comment
		vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Comment line with CTRL + /" })
		vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment line with CTRL + /" })

		-- Visual Mode: Toggle selection comment
		vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Comment selection with CTRL + /" })
		vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comment selection with CTRL + /" })
	end,
}
