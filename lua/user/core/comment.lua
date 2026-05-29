-- Normal Mode: Call the native Neovim commenting system directly
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Comment line fallback" })

-- Visual Mode: Call the native Neovim selection commenting system directly
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comment selection" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Comment selection fallback" })
