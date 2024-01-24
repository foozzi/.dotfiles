local config = function()
	local tree_sitter_context = require("treesitter-context")
	tree_sitter_context.setup({
		multiline_threshold = 1,
	})
end

return {
	"nvim-treesitter/nvim-treesitter-context",
	lazy = false,
	opts = config,
}
