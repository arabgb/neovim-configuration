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
            -- ✨ ADD THIS: Show blame info on current line
            current_line_blame = true, -- Shows blame info in the cursor line
            current_line_blame_opts = {
                virt_text = true,      -- Virtual text next to line
                virt_text_pos = "eol", -- Position at end of line
                delay = 500,           -- Show after 500ms of inactivity
                ignore_whitespace = false,
                priority = 500,
            },

            -- ✨ ADD THIS: Show word diff in the sign column
            word_diff = false, -- Set to true if you want word-level diffs

            -- ✨ ADD THIS: Update content on save
            update_debounce = 100,
            status_formatter = nil, -- Use default
            -- Keymaps for Git actions
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

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
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Next Git hunk" })

                map("n", "[h", function()
                    if vim.wo.diff then
                        return "[h"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, desc = "Prev Git hunk" })

                -- Actions
                map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Git hunk" })
                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end, { desc = "Git blame line" })
            end,
        })
    end,
}
