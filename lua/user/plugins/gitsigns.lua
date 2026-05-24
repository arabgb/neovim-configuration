return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "right_align",
                delay = 500,
                ignore_whitespace = false,
                priority = 100,
            },
            word_diff = false,
            update_debounce = 100,
            status_formatter = nil,
            
            -- Keymaps for Git actions
            on_attach = function(bufnr)
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation through changes
                map("n", "]h", function()
                    if vim.wo.diff then
                        return "]h"
                    end
                    vim.schedule(function()
                        gitsigns.next_hunk() -- 👈 Changed from gs to gitsigns
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Next Git hunk" })

                map("n", "[h", function()
                    if vim.wo.diff then
                        return "[h"
                    end
                    vim.schedule(function()
                        gitsigns.prev_hunk() -- 👈 Changed from gs to gitsigns
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Prev Git hunk" })

                -- Actions
                map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Git hunk" }) -- 👈 Changed gs to gitsigns
                map("n", "<leader>hb", function()
                    gitsigns.blame_line({ full = true }) -- 👈 Changed gs to gitsigns
                end, { desc = "Git blame line" })
            end,
        })
    end,
}
