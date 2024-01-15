return {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			-- diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			offsets = {
				{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left" },
			},
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
}
