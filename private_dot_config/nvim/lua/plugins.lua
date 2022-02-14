local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- TODO: it should be optimized
function Reload()
  for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.cmd [[PackerCompile]]
--
--  for name,_ in pairs(package.loaded) do
--    if name:match('^cnull') then
--      package.loaded[name] = nil
--    end
--  end
--
--  dofile(vim.env.MYVIMRC)
end

-- hello
cmd [[packadd packer.nvim]]
cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/plugins/*.lua lua Reload()
  augroup end
]]

local packer = require 'packer'
local monokai = require 'plugins/monokai'
local nvim_tree = require 'plugins/nvim-tree'
local nvim_treesitter = require 'plugins/nvim-treesitter'
local nvim_autopairs = require 'plugins/nvim-autopairs'
local nvim_lspconfig = require 'plugins/nvim-lspconfig'
local nvim_cmp = require 'plugins/nvim-cmp'
local nvim_telescope = require 'plugins/nvim-telescope'
local nvim_lualine = require 'plugins/nvim-lualine'
local nvim_colorizer = require 'plugins/nvim-colorizer'
local indent_blankline = require 'plugins/indent-blankline'
local nvim_lint = require 'plugins/nvim-lint'
local hop = require 'plugins/hop'
-- for go test coverage
local nvim_goc = require 'plugins/nvim-goc'


-- Add packages
return packer.startup(function(use)
  if packer_bootstrap then
    packer.sync()
  end

  use 'wbthomason/packer.nvim' -- packer can manage itself

  use(monokai)
  use(nvim_tree)
  use(nvim_treesitter)
  use(nvim_autopairs)
  use(nvim_lspconfig)
  use(nvim_cmp)
  use(nvim_telescope)
  use(nvim_lualine)
  use(nvim_colorizer)
  use(indent_blankline)
  use(nvim_lint)
  use(hop)
  use(nvim_goc)
end)
