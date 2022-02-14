local M = {
  'rafaelsq/nvim-goc.lua',
  config = function()
    vim.opt.switchbuf = 'useopen'
    local goc = require'nvim-goc'

    goc.setup {
      verticalSplit = false,
    }

    vim.cmd [[highlight link GocCovered  Function]]

    local map = vim.api.nvim_set_keymap
    local opts = { silent=true, noremap=true }

    map('n', '<leader>gt', "<cmd>lua require'nvim-goc'.Coverage()<cr>", opts)
    map('n', '<leader>gc', "<cmd>lua require'nvim-goc'.ClearCoverage()<cr>", opts)
  end
}

return M
