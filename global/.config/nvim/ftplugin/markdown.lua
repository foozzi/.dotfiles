vim.api.nvim_set_keymap(
	"n",
	"<leader>mdp",
	":lua require('utils.helpers').InsertMarkdownURL()<CR>",
	{ silent = true, noremap = true }
)
vim.opt_local.textwidth = 79
vim.opt_local.wrap = true

-- vim.cmd([[set briopt+=list:-1]])
