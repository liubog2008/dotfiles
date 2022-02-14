local M = {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")

    local indent = require 'indent_blankline'
    indent.setup {
      show_end_of_line = true,
      show_current_context = true,
      -- show_current_context_start = true,
      space_char_blankline = " ",
      use_treesitter = true,
    }
  end
}

return M
