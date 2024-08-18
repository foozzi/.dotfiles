-- inserting a link with a title
vim.api.nvim_set_keymap(
	"n",
	"<leader>mdp",
	":lua require('utils.helpers').InsertMarkdownURL()<CR>",
	{ silent = true, noremap = true }
)
-- formattig a markdown table
vim.api.nvim_set_keymap("n", "<leader>ftt", ":TableFormat<CR>", { silent = true, noremap = true })

-- inserting zettelkasten id (eton)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fl",
	":lua require('utils.helpers').insert_zk_id()<CR>",
	{ silent = true, noremap = true }
)

-- inserting markdown link with uniq name
vim.api.nvim_set_keymap(
	"n",
	"<leader>vwl",
	":lua require('utils.wiki_link').insert_link_with_unique_id()<CR>",
	{ silent = true, noremap = true }
)

-- vim.api.nvim_create_user_command("SearchZettelTitle", function()
-- 	M.search_raw_title({ search_dir = "/Users/fz0x1/Dropbox/TextSync/PKM/00-zettelkasten/" })
-- end, {})
-- mapvimkey("<leader>fm", "SearchZettelTitle", "Search by zettel title")
vim.api.nvim_set_keymap(
	"n",
	"<leader>fm",
	":lua require('utils.telescope_addons').search_raw_title({ search_dir = '/Users/fz0x1/PKM/00-zettelkasten', type = 'zettel' })<CR>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fk",
	":lua require('utils.telescope_addons').search_raw_title({ search_dir = '/Users/fz0x1/PKM' })<CR>",
	{ silent = true, noremap = true }
)

-- vim.opt_local.textwidth = 80
-- vim.opt_local.wrap = true

-- vim.cmd([[set briopt+=list:-1]])
