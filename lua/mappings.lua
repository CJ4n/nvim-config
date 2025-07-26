require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<leader>rn")
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")

-- map({ "n", "i", " "v "v" v" }, "<C-s>", "<cmd> w <cr>")
-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.del("n", "<leader>b")
--

-- This maps space-hr to revert/undo the git hunk under your cursor
vim.keymap.set("n", "<space>hr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })

-- This lets you revert specific lines you've selected in visual mode
vim.keymap.set("v", "<space>hr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-\\>", "<cmd>vsplit<CR>")
--
-- vim.keymap.set("n", "<C-w>", "<cmd>q<CR>")
--
--
-- PRIMAGEN
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle when scorling or serching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d') --delete w/ no buffer write

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
