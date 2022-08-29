-- Completely disable netrw, I hate it
vim.cmd [[
  let g:loaded_netrw       = 1
  let g:loaded_netrwPlugin = 1
]]

require("packer").startup(function(use)
  -- Packer manages itself
  use "wbthomason/packer.nvim"

  use {
    "nvim-neo-tree/neo-tree.nvim",
    requires = { 
      "nvim-lua/plenary.nvim",
      { "kyazdani42/nvim-web-devicons", opt = true },
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "neo-tree".setup {}
    end
  }

  use {
   "windwp/nvim-autopairs",
   config = function()
     require "nvim-autopairs".setup {}
   end
  }

  use {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_style = "night"
      vim.cmd "colorscheme tokyonight"
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require "lualine".setup {}
    end
  }

  use {
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require "bufferline".setup {}
    end
  }

  use {
    "neovim/nvim-lspconfig",
  }
end)
