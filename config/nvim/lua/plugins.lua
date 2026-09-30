vim.cmd.packadd "packer.nvim"

require("packer").startup(function(use)
  use { "wbthomason/packer.nvim", opt = true }
  use { "neovim/nvim-lspconfig", tag = "v2.5.0" }
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
    tag = "0.1.8",
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
          width = 45,
        },
        git = {
          ignore = false,
        },
      }
    end
  }
  use { "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup {
        chunk = {
          enable = true,
          priority = 15,
          style = {
            { fg = "#806d9c" },
            { fg = "#F2F0AB" },
          },
          use_treesitter = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          textobject = "",
          max_file_size = 1024 * 1024,
          error_sign = true,
          -- animation related
          duration = 200,
          delay = 300,
        },
        indent = {
          enable = true,
          priority = 10,
          style = { vim.api.nvim_get_hl(0, { name = "Whitespace" }) },
          use_treesitter = false,
          chars = { "┊" },
          ahead_lines = 5,
          delay = 100,
        },
      }
    end
  }
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }
end)
