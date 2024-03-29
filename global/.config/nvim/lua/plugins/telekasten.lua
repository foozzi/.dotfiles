local templates = vim.fn.expand("~/Dropbox/TextSync/99-templates")

local config = function()
	require("telekasten").setup({
		-- home = vim.fn.expand("~/Dropbox/TextSync/00-zettel"),
		-- dailies = vim.fn.expand("~/Dropbox/TextSync/00-zettel/dialy"),
		templates = templates,
		template_new_note = templates .. "/" .. "new_note",
		template_new_daily = templates .. "/" .. "dialy_note",
		image_subdir = "img",
		media_previewer = "catimg-previewer",
		vim.api.nvim_command("hi tkLink ctermfg=36 cterm=bold,underline guifg=#10ac84 gui=bold,underline"),
		vim.api.nvim_command("hi tkBrackets ctermfg=gray guifg=gray"),

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "telekasten",
			callback = function()
				-- Call insert link automatically when we start typing a link
				-- @TODO moving to own plugin
				vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
				vim.api.nvim_command("setlocal textwidth=80")
			end,
		}),

		-- Launch panel if nothing is typed after <leader>z
		vim.keymap.set("n", "<leader>nm", "<cmd>Telekasten panel<CR>"),

		-- Most used functions
		-- vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>"),
		-- vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>"),
		-- vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>"),
		-- vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>"),
		-- vim.keymap.set("n", "<leader>nz", "<cmd>Telekasten new_note<CR>"),
		-- vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>"),
		-- vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>"),
		-- vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>"),
	})
end

return {
	"renerocksai/telekasten.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"renerocksai/calendar-vim",
	},
	config = config,
	lazy = false,
}
