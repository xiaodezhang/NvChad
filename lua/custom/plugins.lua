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
   "phaazon/hop.nvim",
    branch = "v2",
    lazy = false,
    config = function()
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, {remap=true})
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, {remap=true})

      vim.keymap.set('', '<leader>w', function()
        hop.hint_words()
      end, {remap=true})

      vim.keymap.set('', 's', function()
        hop.hint_char1()
      end, {remap=true})

      vim.keymap.set('', 'S', function()
        hop.hint_char1({multi_windows=true})
      end, {remap=true})

      hop.setup()
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
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
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
