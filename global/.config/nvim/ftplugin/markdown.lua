local zettelkasten_dir = require("core.options").zettelkasten_dir
local pkm_dir = require("core.options").pkm_dir
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
	":lua require('utils.telescope_addons').search_raw_title({ search_dir = '"
		.. zettelkasten_dir
		.. "', type = 'zettel' })<CR>",
	{ silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fk",
	":lua require('utils.telescope_addons').search_raw_title({ search_dir = '" .. pkm_dir .. "' })<CR>",
	{ silent = true, noremap = true }
)

vim.opt_local.textwidth = 80
vim.opt_local.colorcolumn = "80"
-- vim.opt_local.wrap = true

-- vim.cmd([[set briopt+=list:-1]])
