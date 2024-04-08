-- inserting a link with a title
vim.api.nvim_set_keymap(
	"n",
	"<leader>mdp",
	":lua require('utils.helpers').InsertMarkdownURL()<CR>",
	{ silent = true, noremap = true }
)
-- formattig a markdown table
vim.api.nvim_set_keymap("n", "<leader>ftt", ":TableFormat<CR>", { silent = true, noremap = true })

vim.opt_local.textwidth = 79
vim.opt_local.wrap = true

-- vim.cmd([[set briopt+=list:-1]])
