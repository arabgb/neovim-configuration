return {
    {
        "Shatur/neovim-ayu",
        name = "ayu",
        priority = 1000, -- Load this before all other plugins
        config = function()
            -- Configure ayu settings if needed
            require("ayu").setup({
                mirage = false, -- Set to true to use the "Mirage" variant
            })
            -- Set the colorscheme
            vim.cmd([[colorscheme ayu]])
        end,
    },
}
