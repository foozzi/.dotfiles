local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values
local pickers = require('telescope.pickers')
local actions = require("telescope.actions")
local mapvimkey = require("utils.keymapper").mapvimkey

local M = {}

-- local function paste_titled_link()
-- 	return function(prompt_bufnr)
-- 		actions.close(prompt_bufnr)
-- 		local selection = action_state.get_selected_entry()
-- 		local parts = vim.split(selection.value, ":")
-- 		local filename_part = parts[1]
-- 		local title = parts[#parts]:match("^%s*(.-)%s*$")
-- 		local link = "[" .. title .. "](../" .. filename_part .. ")"
-- 		vim.api.nvim_put({ link }, "", true, true)
-- 	end
-- end
--
-- local function paste_link()
-- 	return function(prompt_bufnr)
-- 		actions.close(prompt_bufnr)
-- 		local selection = action_state.get_selected_entry()
-- 		local filename_part = vim.split(selection.value, ":")[1]
-- 		local link = "[[../" .. filename_part .. "]]"
-- 		vim.api.nvim_put({ link }, "", true, true)
-- 	end
-- end
--
-- M.search_title = function()
-- 	require("telescope.builtin").live_grep({
-- 		cwd = "~/Dropbox/TextSync/NOTES/",
-- 		prompt_title = "Search by zettel title",
-- 		default_text = "^raw_title: ",
-- 		attach_mappings = function(_, map)
-- 			map("n", "<c-i>", paste_titled_link())
-- 			map("i", "<c-i>", paste_titled_link())
-- 			map("n", "<c-u>", paste_link())
-- 			map("i", "<c-u>", paste_link())
-- 			return true
-- 		end,
-- 	})
-- end
--
-- M.copy_filename_to_clipboard = function(prompt_bufnr)
-- 	local selection = action_state.get_selected_entry()
-- 	local filename_part = vim.split(selection.value, ":")[1]
-- 	vim.fn.setreg("*", filename_part)
-- 	vim.fn.setreg("+", filename_part)
-- 	print("Copied filename: " .. filename_part)
-- 	actions.close(prompt_bufnr)
-- end

M.search_raw_title = function(opts)
  opts = opts or {}
  local search_dir = opts.search_dir or "."

  pickers.new(opts, {
    prompt_title = "Search ETON",
    finder = finders.new_job(function(prompt)
      if not prompt then
        return nil
      end

      -- Adjust the rg command to search for raw_title in all files
      local cmd = { "rg", "--no-heading", "--color=never", "--with-filename", "--line-number", "-i", "raw_title:.*" .. prompt, search_dir }
      return cmd
    end, opts.entry_maker or function(entry)
      local filename, lnum, raw_title = entry:match("([^:]+):(%d+):raw_title:(.*)")
      if not filename then return nil end

      -- Получаем только базовое имя файла
      local basename = filename:match("^.+/(.+)$") or filename

      return {
        value = entry,
        ordinal = basename .. " " .. (raw_title or ""),
        display = basename .. " - " .. (raw_title or ""),
        filename = filename,
        lnum = tonumber(lnum),
      }
    end),
    previewer = previewers.new_buffer_previewer({
      define_preview = function(self, entry, status)
        conf.buffer_previewer_maker(entry.filename, self.state.bufnr, {
          bufname = self.state.bufname,
          winid = self.state.winid,
          preview = self.state.preview
        })
        vim.api.nvim_buf_call(self.state.bufnr, function()
          vim.fn.cursor(entry.lnum, 0)
          vim.cmd("normal! zz")
        end)
      end
    }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(_, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(_)
        vim.cmd('edit ' .. selection.filename)
        vim.fn.cursor(selection.lnum, 0)
      end)
      return true
    end,
  }):find()
end

-- vim.api.nvim_create_user_command("SearchZettelTitle", M.search_title, {})
-- mapvimkey("<leader>fm", "SearchZettelTitle", "Search by zettel title")

-- vim.api.nvim_create_user_command("SearchZettelTitle", M.search_raw_title({search_dir='/Users/fz0x1/Dropbox/TextSync/NOTES/01-zettel/'}), {})
vim.api.nvim_create_user_command("SearchZettelTitle", function()
  M.search_raw_title({ search_dir = '/Users/fz0x1/Dropbox/TextSync/NOTES/01-zettel/' })
end, {})
mapvimkey("<leader>fm", "SearchZettelTitle", "Search by zettel title")

return M
