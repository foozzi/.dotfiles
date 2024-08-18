local options = require("core.options")

local M = {}

local function generate_id(length)
	local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local id = ""
	for i = 1, length do
		local rand = math.random(#chars)
		id = id .. chars:sub(rand, rand)
	end
	return id
end

local function file_exists(directory, filename)
	local filepath = directory .. "/" .. filename
	local file = io.open(filepath, "r")
	if file then
		io.close(file)
		return true
	else
		return false
	end
end

local function generate_unique_id(directory, length)
	local id
	repeat
		id = generate_id(length)
	until not file_exists(directory, id .. ".md")
	return id
end

function M.insert_link_with_unique_id()
	local id_length = 8

	local unique_id = generate_unique_id(options.resources_dir, id_length)

	local link = string.format("[name](%s.md)", unique_id)

	vim.api.nvim_put({ link }, "c", true, true)
end

return M
