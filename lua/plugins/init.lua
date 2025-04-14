return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
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
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "gotmpl",
        "javascript",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = {
          "html",
          "tmpl",
        },
      },
      parser_config = {
        html = {
          used_by = { "tmpl", "html" },
        },
      },
      injections = {
        enable = true,
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, conf)
      conf.filters = {
        custom = {
          "^.git$",
          "^node_modules$",
          -- "^views/.+%.go$",
          "^__pycache__$",
        },
      }
      return conf
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
  },
  {
    "tpope/vim-fugitive",
    enabled = true,
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
    },
  },
}
