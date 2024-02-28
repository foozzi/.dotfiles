local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local mapvimkey = require("utils.keymapper").mapvimkey

local M = {}

local function paste_titled_link()
	return function(prompt_bufnr)
		actions.close(prompt_bufnr)
		local selection = action_state.get_selected_entry()
		local parts = vim.split(selection.value, ":")
		local filename_part = parts[1]
		local title = parts[#parts]:match("^%s*(.-)%s*$")
		local link = "[" .. title .. "](" .. filename_part .. ")"
		vim.api.nvim_put({ link }, "", true, true)
	end
end

local function paste_link()
	return function(prompt_bufnr)
		actions.close(prompt_bufnr)
		local selection = action_state.get_selected_entry()
		local filename_part = vim.split(selection.value, ":")[1]
		local link = "[[" .. filename_part .. "]]"
		vim.api.nvim_put({ link }, "", true, true)
	end
end

M.search_title = function()
	require("telescope.builtin").live_grep({
		prompt_title = "Search by zettel title",
		default_text = "^raw_title: ",
		attach_mappings = function(_, map)
			map("n", "<c-i>", paste_titled_link())
			map("i", "<c-i>", paste_titled_link())
			map("n", "<c-u>", paste_link())
			map("i", "<c-u>", paste_link())
			return true
		end,
	})
end

M.copy_filename_to_clipboard = function(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	local filename_part = vim.split(selection.value, ":")[1]
	vim.fn.setreg("*", filename_part)
	vim.fn.setreg("+", filename_part)
	print("Copied filename: " .. filename_part)
	actions.close(prompt_bufnr)
end

vim.api.nvim_create_user_command("SearchZettelTitle", M.search_title, {})
mapvimkey("<leader>fm", "SearchZettelTitle", "Search by zettel title")

return M
