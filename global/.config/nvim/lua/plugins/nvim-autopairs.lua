local config = function()
	local Rule = require("nvim-autopairs.rule")
	local conds = require("nvim-autopairs.conds")
	local npairs = require("nvim-autopairs")

	require("nvim-autopairs").setup({})

	npairs.add_rule(Rule('"""', '"""', "python"):with_pair(function()
		return false
	end))
end

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = config, -- this is equalent to setup({}) function
}
