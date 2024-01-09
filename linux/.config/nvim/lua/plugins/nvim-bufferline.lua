local config = function()
	require("bufferline").setup()
end

return {
	"akinsho/bufferline.nvim",
	opts = config,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
}
