-- local api = require('Comment.api')

-- vim.keymap.set("n", <C-/>, function() api.toggle.linewise.current() end, {noremap=true, silent=true})

vim.keymap.set("n", "<C-_>", function()
	require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
