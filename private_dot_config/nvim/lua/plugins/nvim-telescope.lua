local M = {
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
      }
    }

    telescope.load_extension('fzf')

    local map = vim.api.nvim_set_keymap
    local opts = {noremap = true, silent = true}
    map('n', 'ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
    map('n', 'fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
    map('n', 'fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
    map('n', 'fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
  end
}

return M
