local M = {}

function M.InsertMarkdownURL()
  local url = vim.fn.getreg "+"
  if url == "" then return end
  local cmd = "curl -L " .. vim.fn.shellescape(url) .. " 2>/dev/null"
  local handle = io.popen(cmd)
  if not handle then return end
  local html = handle:read "*a"
  handle:close()
  local title = ""
  local pattern = "<title>(.-)</title>"
  local m = string.match(html, pattern)
  if m then title = m end
  if title ~= "" then
    title = title:gsub("%[", "(")
    title = title:gsub("%]", ")")
    local markdownLink = "[" .. title .. "](" .. url .. ")"
    vim.api.nvim_put({markdownLink}, "", true, true)
    -- vim.api.nvim_command("call append(line('.'), '" .. markdownLink .. "')")
  else
    print("Title not found for link")
  end
end

return M
