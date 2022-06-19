local M = {
  'tanvirtin/monokai.nvim',
  config = function()
    local monokai = require'monokai'
    monokai.setup()

    vim.cmd [[colorscheme monokai]]
  end
}

return M
