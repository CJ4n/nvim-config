local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1

  if directory then
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
