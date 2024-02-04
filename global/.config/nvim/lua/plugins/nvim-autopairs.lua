local config = function()
	require("nvim-autopairs").setup({})
end

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = config, -- this is equalent to setup({}) function
}
