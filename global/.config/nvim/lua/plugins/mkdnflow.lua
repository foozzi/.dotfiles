return {
	"foozzi/mkdnflow.nvim",
	lazy = false,
	config = function()
		require("mkdnflow").setup({
			modules = {
				bib = true,
				buffers = true,
				conceal = true,
				cursor = true,
				folds = true,
				links = true,
				lists = true,
				maps = true,
				paths = true,
				tables = true,
				yaml = true,
				cmp = true,
			},
			filetypes = { md = true, rmd = true, markdown = true, telekasten = true },
		})
	end,
}
