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
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {}
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
    },
    lazy = false,
    config = function()
      require("dapui").setup()
      require("dap-python").setup("../.venv/bin/python")
      require("dap-go").setup()
      -- require("nvim-nio").setup()
      require("nvim-dap-virtual-text").setup()
      require('dap.ext.vscode').load_launchjs(nil, { debugby = { 'py' } })
      -- TODO: this is too slow i guess i just need to use one main config...
      local dap, dapui = require("dap"), require("dapui")


      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- dap.configurations.python = {
      -- {
      --   type = 'python',
      --   request = 'launch',
      --   name = "Run autograder.py",
      --   program = "${workspaceFolder}/autograder.py",
      --   cwd = "${workspaceFolder}",
      --   pythonpath = function()
      --     return '../.venv/bin/python'
      --   end,
      -- },
      -- }
    end,
    opts = {

    }
  }
}
