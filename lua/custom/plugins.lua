local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  -- {
  --   "HiPhish/nvim-ts-rainbow2",
  --   lazy = false,
  --   config = function()
  --     require("ts_rainbow").setup()
  --   end
  -- },

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = overrides.treesitter,
  -- },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      {
        "tpope/vim-fugitive",
      },
    },
  },
  {
    "mhinz/vim-startify",
    lazy = false,
  },

  {
    "mattn/emmet-vim",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
  },
  {
    'RRethy/vim-illuminate',
    lazy = false,
  },
  {
    'kevinhwang91/nvim-hlslens',
    lazy = false,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = false,
  },
  {
    "equalsraf/neovim-gui-shim",
    lazy = false,
  },
  {
    "vim-scripts/a.vim",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    'ggandor/leap.nvim',
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4
        }
      })
    end,
    lazy = false,
  },
  {
    'gelguy/wilder.nvim',
    lazy = false,
    config = function()
      local wilder = require('wilder')
      wilder.setup({modes = {':', '/', '?'}})

      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline(),
          wilder.search_pipeline()
        ),
      })

      wilder.set_option('renderer', wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }))
    end,
  },
  {
    'chentoast/marks.nvim',
    lazy = false,
    config = function()
      require("marks").setup({
        -- default_mappings = false,
        mappings = {
          toggle = "mm",
          preview = 'mv',
          next = 'mi',
          prev = 'mo'
        }
      })
    end,
  },



  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
