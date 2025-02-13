-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>d]", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "<leader>d[", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("n", "<C-a>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-d>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-s>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-w>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- setup for nvim-trer
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>sk", ":Telescope keymaps<CR>", { desc = "Search in keypas using Telescope" })

-- custom key
-- go to next file
vim.keymap.set("n", "<leader>b]", ":bnext<CR>", { desc = "Go to the next buffer" })
vim.keymap.set("n", "<leader>b[", ":bprevious<CR>", { desc = "Go to the previous buffer" })

-- window commands
--  open virtual window, horizantal window
vim.keymap.set("n", "<leader>w-", ":split<CR>", { desc = "splite the windows horizantal" })
vim.keymap.set("n", "<leader>w|", ":vsplit<CR>", { desc = "split the window virtual" })

--- comment/uncomment code
-- vim.keymap.set("n", "<C-_>", "gcc", { desc = "Comment/Uncomment line or block" })
-- vim.keymap.set("i", "<C-_>", "gcc", { desc = "Comment/Uncomment line or block" })
-- vim.keymap.set("v", "<C-_>", "gcc", { desc = "Comment/Uncomment line or block" })
-- todo
vim.keymap.set("n", "<leader>t]", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>t[", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
