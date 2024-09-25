vim.cmd.packadd "packer.nvim"

require("packer").startup(function(use)
  use { "wbthomason/packer.nvim", opt = true }
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/cmp-vsnip"
  use "github/copilot.vim"
  use { "akinsho/bufferline.nvim",
    tag = "*",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  }
  use { "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
      }
    end,
  }
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.cmd [[colorscheme catppuccin-mocha]]
    end
  }
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 40,
        },
        git = {
          ignore = false,
        },
      }
    end
  }
end)
