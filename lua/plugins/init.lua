return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css"
      },
    },
  },
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   extensions = { "project" }
  -- },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true
  },
  {
    "tpope/vim-fugitive",
    enabled = true,
    lazy = false
  },
}
