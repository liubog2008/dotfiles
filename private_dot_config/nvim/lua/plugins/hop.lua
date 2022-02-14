local M = {
  'phaazon/hop.nvim',
  branch = 'v1',
  config = function()
    local hop = require'hop'

    hop.setup { keys = 'etovxqpdygfblzhckisuran' }

    local map = vim.api.nvim_set_keymap
    map('n', '<leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
    map('n', '<leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
    map('o', '<leader>f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
    map('o', '<leader>F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})

    map('n', '<leader>j', "<cmd>lua require'hop'.hint_lines_skip_whitespace({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
    map('n', '<leader>k', "<cmd>lua require'hop'.hint_lines_skip_whitespace({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})
    map('o', '<leader>j', "<cmd>lua require'hop'.hint_lines_skip_whitespace({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump⋅=⋅true })<cr>", {})
    map('o', '<leader>k', "<cmd>lua require'hop'.hint_lines_skip_whitespace({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump⋅=⋅true })<cr>", {})

    map('n', '<leader>w', "<cmd>lua require'hop'.hint_words()<cr>", {})

  end

}

return M
