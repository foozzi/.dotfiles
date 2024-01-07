local config = function()
  require('ts_context_commentstring').setup {
    enable_autocmd = false,
  }
  require('Comment').setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
end

return {
	"numToStr/Comment.nvim",
	opts = config,
	lazy = false,
  dependencies = {
    {"JoosepAlviste/nvim-ts-context-commentstring"}
  }
}
