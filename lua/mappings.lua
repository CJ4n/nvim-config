require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<leader>rn")
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.del("n", "<leader>b")
--
local dap = require("dap")
-- TODO: step over etc not working as terminal intercepts them...
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<leader><F5>', dap.run_last)
vim.keymap.set('n', '<F4>', dap.terminate)
-- vim.keymap.set('n', '<F5>', function()
--   -- (Re-)reads launch.json if present
--   if vim.fn.filereadable(".vscode/launch.json") then
--     require("dap.ext.vscode").load_launchjs(nil, { debugby = { "py" } })
--   end
--   require("dap").continue()
-- end)
vim.keymap.set('n', '<F9>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.del("n", "<leader>b")
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)

-- This maps space-hr to revert/undo the git hunk under your cursor
vim.keymap.set('n', '<space>hr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })

-- This lets you revert specific lines you've selected in visual mode
vim.keymap.set('v', '<space>hr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
