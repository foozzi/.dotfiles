return {
	"foozzi/mkdnflow.nvim",
	lazy = true,
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
			links = {
				transform_explicit = function(text)
					return text
				end,
				style = "wiki",
				name_is_source = true,
			},
		})
	end,
	dependencies = {
		"bullets-vim/bullets.vim",
	},
}
