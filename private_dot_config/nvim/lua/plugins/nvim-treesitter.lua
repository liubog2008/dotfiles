local M = {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    local p = require'nvim-treesitter.configs'
    p.setup {
      -- One of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = {
        'go',
        'gomod',
        'rust',
        'javascript',
        'typescript',
        'tsx',
        'vim',
        'lua',
        'bash',
        'markdown',
        'make',
      },

      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- List of parsers to ignore installing
      ignore_install = {},

      highlight = {
        enable = true,

        disable = {},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
  end
}

return M
