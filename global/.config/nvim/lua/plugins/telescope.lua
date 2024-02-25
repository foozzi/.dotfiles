local mapvimkey = require("utils.keymapper").mapvimkey

local config = function()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	-- copy file name from search
	local copy_filename_to_clipboard = function(prompt_bufnr)
		local selection = action_state.get_selected_entry()
		local filename_part = vim.split(selection.value, ":")[1]
		vim.fn.setreg("*", filename_part)
		vim.fn.setreg("+", filename_part)
		print("Copied filename: " .. filename_part)
		actions.close(prompt_bufnr)
	end

	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<C-c>"] = copy_filename_to_clipboard,
				},
				n = {
					["<C-c>"] = copy_filename_to_clipboard,
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = true,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		mapvimkey("<leader>fk", "Telescope keymaps", "Show Keymaps"),
		mapvimkey("<leader>fh", "Telescope help_tags", "Show Help Tags"),
		mapvimkey("<leader>ff", "Telescope find_files", "Find Files"),
		mapvimkey("<leader>fg", "Telescope live_grep", "Live Grep"),
		mapvimkey("<leader>fb", "Telescope buffers", "Find Buffers"),
	},
}
