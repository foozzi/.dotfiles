local M = {}

function M.tabline()
	local s = ""
	for i = 1, vim.fn.tabpagenr("$") do
		local winnr = vim.fn.tabpagewinnr(i)
		local buflist = vim.fn.tabpagebuflist(i)
		local bufnr = buflist[winnr]
		local bufname = vim.fn.bufname(bufnr)
		local filename = vim.fn.fnamemodify(bufname, ":t")
		local icon = require("nvim-web-devicons").get_icon(filename)

		-- Отмечаем активный таб
		if i == vim.fn.tabpagenr() then
			s = s .. "%#TabLineSel#"
		else
			s = s .. "%#TabLine#"
		end

		s = s .. " " .. (icon or "") .. " " .. filename .. " "
	end
	s = s .. "%#TabLineFill#%="
	return s
end

return M
