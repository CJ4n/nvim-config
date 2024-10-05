vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
require "configs.nvim-tree"
-- local dap = require('dap')

-- vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
-- dap.configurations.python = {
--   {
--     type = 'python',
--     request = 'launch',
--     name = "Run autograder.py",
--     program = "${workspaceFolder}/autograder.py",
--     cwd = "${workspaceFolder}",
--     pythonPath = function()
--       -- Adjust this path to your Python interpreter if needed
--       return 'python'
--     end,
--   },
-- }
-- Set the root directory for your project
-- vim.api.nvim_command([[
--   autocmd FileType python lua require('dap.ext.autocompl').attach()
--   autocmd FileType python lua vim.fn.setenv("PYTHONPATH", vim.fn.expand("~/yan_files/1_semester/fundam/labs/p1"))
-- ]])

vim.schedule(function()
  require "mappings"
end)
