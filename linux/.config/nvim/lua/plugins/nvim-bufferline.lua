local config = function()
	local bufferline = require("bufferline")
	bufferline.setup({
		options = {
			-- style_preset = bufferline.style_preset.no_italic,
			-- or you can combine these e.g.
			style_preset = {
				bufferline.style_preset.no_italic,
				bufferline.style_preset.no_bold,
			},
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
		},
	})
end

return {
	"akinsho/bufferline.nvim",
	opts = config,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
}
