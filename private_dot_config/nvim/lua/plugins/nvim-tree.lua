local M = {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons',
  },

  config = function(name, plugin)
    local p = require 'nvim-tree'
    p.setup {
      disable_netrw       = true,
      hijack_netrw        = true,
      open_on_setup       = false,
      ignore_ft_on_setup  = {},
      open_on_tab         = false,
      hijack_cursor       = false,
      update_cwd          = false,
      update_to_buf_dir   = {
        enable = true,
        auto_open = true,
      },
      diagnostics = {
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },
      update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
      },
      filters = {
        dotfiles = false,
        custom = {}
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
          custom_only = false,
          list = {
            { key = { "<CR>", "o", },                 action = "edit" },
            { key = "<C-e>",                          action = "edit_in_place" },
            { key = "O",                              action = "edit_no_picker" },
            { key = { "cd", "<C-]>" },                action = "cd" },
            { key = "v",                              action = "vsplit" },
            { key = "s",                              action = "split" },
            { key = "<C-t>",                          action = "tabnew" },
            { key = "<",                              action = "prev_sibling" },
            { key = ">",                              action = "next_sibling" },
            { key = "P",                              action = "parent_node" },
            { key = "<BS>",                           action = "close_node" },
            { key = "<Tab>",                          action = "preview" },
            { key = "K",                              action = "first_sibling" },
            { key = "J",                              action = "last_sibling" },
            { key = "I",                              action = "toggle_git_ignored" },
            { key = "H",                              action = "toggle_dotfiles" },
            { key = "U",                              action = "toggle_custom" },
            { key = "R",                              action = "refresh" },
            { key = "a",                              action = "create" },
            { key = "d",                              action = "remove" },
            { key = "D",                              action = "trash" },
            { key = "r",                              action = "rename" },
            { key = "<C-r>",                          action = "full_rename" },
            { key = "x",                              action = "cut" },
            { key = "c",                              action = "copy" },
            { key = "p",                              action = "paste" },
            { key = "y",                              action = "copy_name" },
            { key = "Y",                              action = "copy_path" },
            { key = "gy",                             action = "copy_absolute_path" },
            { key = "[c",                             action = "prev_git_item" },
            { key = "]c",                             action = "next_git_item" },
            { key = "-",                              action = "dir_up" },
            { key = "s",                              action = "system_open" },
            { key = "f",                              action = "live_filter" },
            { key = "F",                              action = "clear_live_filter" },
            { key = "q",                              action = "close" },
            { key = "W",                              action = "collapse_all" },
            { key = "E",                              action = "expand_all" },
            { key = "S",                              action = "search_node" },
            { key = ".",                              action = "run_file_command" },
            { key = "<C-k>",                          action = "toggle_file_info" },
            { key = "g?",                             action = "toggle_help" },
          }
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
      },
      trash = {
        cmd = "trash",
        require_confirm = true
      },
      actions = {
        change_dir = {
          global = false,
        },
        open_file = {
          quit_on_open = false,
        }
      }
    }

    local map = vim.api.nvim_set_keymap
    local opts = {noremap = true, silent = true}
    map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
    map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)
    map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)
  end
}

return M
