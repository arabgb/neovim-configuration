return {
	"famiu/bufdelete.nvim",
	-- Bind it to a key
	config = function()
		vim.keymap.set("n", "<leader>bx", "<cmd>Bdelete<cr>", { desc = "Close Buffer but keep layout" })
	end,
}
