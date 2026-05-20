return {
	"sphamba/smear-cursor.nvim",
	event = "VeryLazy",
	config = function()
		-- Use underscore instead of hyphen
		local smear_cursor = require("smear_cursor")

		smear_cursor.setup({
			-- How fast the smear follows the cursor
			stiffness = 0.6,
			-- How much the cursor "trails" behind
			trailing_stiffness = 0.3,
			-- Distance at which the smear disappears
			distance_stop_animating = 0.1,
		})
	end,
}
