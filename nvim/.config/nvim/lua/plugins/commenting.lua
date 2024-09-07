return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	"numToStr/Comment.nvim",
    config = function()
      require('Comment').setup {
        pre_hook = function()
          return vim.bo.commentstring
        end,
      }
    end,
	-- config = function()
	-- 	require("Comment").setup({
	--            enable_autocmd = false,
	--            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
	-- 	})
	-- end,
}
