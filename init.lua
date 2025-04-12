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
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

vim.keymap.set("n", "<leader>sc", "z=", { noremap = true, desc = "Show spelling suggestions" })
-- bask
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

vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define("DapBreakpoint", {
  text = "🔴",
  texthl = "DapBreakpoint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapBreakpointRejected",
  { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapLogPoint",
  { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldminlines = 1
vim.opt.foldnestmax = 1

vim.lsp.inlay_hint.enable()

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
})
