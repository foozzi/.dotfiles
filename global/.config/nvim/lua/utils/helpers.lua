local mapvimkey = require("utils.keymapper").mapvimkey

local M = {}

function M.InsertMarkdownURL()
	local url = vim.fn.getreg("+")
	if url == "" then
		return
	end
	local cmd = "curl -L " .. vim.fn.shellescape(url) .. " 2>/dev/null"
	local handle = io.popen(cmd)
	if not handle then
		return
	end
	local html = handle:read("*a")
	handle:close()
	local title = ""
	local pattern = "<title[^>]*>(.-)</title>"
	local m = string.match(html, pattern)
	if m then
		title = m
	end
	if title ~= "" then
		title = title:gsub("%[", "(")
		title = title:gsub("%]", ")")
		local markdownLink = "[" .. title .. "](" .. url .. ")"
		vim.api.nvim_put({ markdownLink }, "", true, true)
	-- vim.api.nvim_command("call append(line('.'), '" .. markdownLink .. "')")
	else
		print("Title not found for link")
	end
end

-- inserting zettelkasten link with an id
function M.insert_zk_id()
	local handle = io.popen("eton zk id")
	local id = handle:read("*a")
	handle:close()

	id = id:gsub("%s+", "")

	local insert_text = string.format("[](%s.md)", id)
	vim.api.nvim_put({ insert_text }, "c", true, true)

	vim.api.nvim_feedkeys("i", "n", true)
end

function M.get_relative_path(from, to)
	local from_dir = vim.fn.fnamemodify(from, ":p:h")
	local to_file = vim.fn.fnamemodify(to, ":p")
	local from_parts = vim.split(from_dir, "/")
	local to_parts = vim.split(to_file, "/")

	while #from_parts > 0 and #to_parts > 0 and from_parts[1] == to_parts[1] do
		table.remove(from_parts, 1)
		table.remove(to_parts, 1)
	end

	local relative_path = string.rep("../", #from_parts) .. table.concat(to_parts, "/")
	return relative_path
end

return M
