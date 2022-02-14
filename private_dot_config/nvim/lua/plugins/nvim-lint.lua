local M = {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      go = {'golangcilint'}
    }


    vim.cmd [[
      augroup nvim_lint
        autocmd!
        autocmd BufWritePost <buffer> lua require('lint').try_lint()
      augroup end
    ]]
  end
}

return M
