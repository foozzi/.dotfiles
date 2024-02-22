local config = function()
	require("telekasten").setup({
		home = vim.fn.expand("~/Productivity/notes"),
		vim.api.nvim_command("hi tkLink ctermfg=36 cterm=bold,underline guifg=#10ac84 gui=bold,underline"),
		vim.api.nvim_command("hi tkBrackets ctermfg=gray guifg=gray"),
	})
end

return {
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = config,
	lazy = false,
}
