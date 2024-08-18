return {
	"jakewvincent/mkdnflow.nvim",
	-- ft = "markdown",
	config = function()
		require("mkdnflow").setup({
			modules = {
				cmp = false,
			},
		})
	end,
	-- Your other plugins
}
