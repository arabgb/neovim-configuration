-- NOTE: WELCOMEi
-- TODO: This is work
require("user.options")
require("user.keymaps")
require("user.autocommands")
require("user.lazy")
require("user.colorscheme")
require("user.telescope")
require("user.nvimtree")
require("user.treesitter")
require("user.lsp")
require("user.comment")
require("user.auto-tag")
require("user.luasnip")
require("user.lualine")
require("user.bufferline")
require("user.js-doc")
-- require("user.conform")
-- require("user.vim-prettier")
require("user.nvim-cmp")
require("user.workspace-diagnostics")
-- TODO: I LOVE NVIM

local function clean_my_code()
	local current_view = vim.fn.winsaveview()
	pcall(function()
		vim.cmd([[ %s/\s\+$//e ]])
	end)
	vim.cmd([[ normal! gg=G ]])
	vim.fn.winrestview(current_view)
	print("Code Cleaned")
end

vim.keymap.set("n", "<leader>q", clean_my_code, { desc = " Clean My Code" })

local function customize_ui()
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#00ff00", bold = false })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2d3343" })
end

-- customize_ui()
