local api = require("Comment.api")

-- vim.keymap.set("n", <C-/>, function() api.toggle.linewise.current() end, {noremap=true, silent=true})
--
-- vim.keymap.set("n", "<C-_>", function()
-- 	require("Comment.api").toggle.linewise.current()
-- end, { noremap = true, silent = true })
--
--
-- vim.keymap.set("i", "<C-_>", function()
-- 	require("Comment.api").toggle.linewise.current()
-- end, { noremap = true, silent = true })
--
--
-- vim.keymap.set("v", "<C-_>", function()
-- 	require("Comment.api").toggle.blockwise.current()
-- end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-_>", api.call("toggle.linewise.current", "g@$"), { expr = true })

vim.keymap.set("i", "<C-_>", api.call("toggle.linewise.current", "g@$"), { expr = true })

vim.keymap.set("v", "<C-_>", api.call("toggle.linewise", "g@$"), { expr = true })

vim.keymap.set("n", "<C-/>", api.call("toggle.linewise.current", "g@$"), { expr = true })

vim.keymap.set("i", "<C-/>", api.call("toggle.linewise.current", "g@$"), { expr = true })

vim.keymap.set("v", "<C-/>", api.call("toggle.linewise", "g@$"), { expr = true })
