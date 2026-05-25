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
            -- Change inactive line numbers to a dim, subtle gray
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#5c6370", bg = "NONE" })
        end,
    },
}
