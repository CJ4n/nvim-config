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
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, conf)
      conf.filters = { custom = { "^.git$" } }
      return conf
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, conf)
      -- require 'telescope'.load_extension('project')
      -- conf.load_extension("project")
      -- conf.extensions = { "project" }
      return conf
    end
    -- extensions = { "project" }
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true
  },
  {
    "tpope/vim-fugitive",
    enabled = true,
    lazy = false
  },
  -- TODO: s
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {}
  }
}
