local config = function()
	local npairs = require("nvim-autopairs")
	-- npairs.remove_rule('"""')
end

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = config, -- this is equalent to setup({}) function
}
