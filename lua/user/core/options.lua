local opt = vim.opt

-- Setting for interface and appearance
opt.relativenumber = false
opt.number = true
opt.termguicolors = true

-- setting for spaces (Tabs and indentation)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- search optimization
opt.ignorecase = true
opt.smartcase = true

-- general setting
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- configure arabic
opt.encoding = "utf-8"
opt.arabicshape = true
opt.termbidi = true

-- Disable swap files if you trust your save-on-format setup
opt.swapfile = false

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10
