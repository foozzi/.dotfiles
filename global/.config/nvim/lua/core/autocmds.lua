-- local helpers = require("core.helpers")
-- auto-format on save
-- local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = lsp_fmt_group,
-- 	callback = function()
-- 		local efm = vim.lsp.get_clients({ name = "efm" })
--
-- 		if vim.tbl_isempty(efm) then
-- 			return
-- 		end
--
-- 		vim.lsp.buf.format({ name = "efm", async = true })
-- 	end,
-- })

-- highlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYankGroup", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- https://jrnl.sh/en/stable/privacy-and-security/#neovim
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPre" }, {
	group = vim.api.nvim_create_augroup("PrivateJrnl", {}),
	pattern = "*.jrnl",
	callback = function()
		vim.o.shada = ""
		vim.o.swapfile = false
		vim.o.undofile = false
		vim.o.backup = false
		vim.o.writebackup = false
		vim.o.shelltemp = false
		vim.o.history = 0
		vim.o.modeline = false
		vim.o.secure = true
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.jrnl",
	command = "set filetype=jrnl",
})
