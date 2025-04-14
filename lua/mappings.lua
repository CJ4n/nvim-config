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

-- This maps space-hr to revert/undo the git hunk under your cursor
vim.keymap.set("n", "<space>hr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })

-- This lets you revert specific lines you've selected in visual mode
vim.keymap.set("v", "<space>hr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-\\>", "<cmd>vsplit<CR>")
--
-- vim.keymap.set("n", "<C-w>", "<cmd>q<CR>")
