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
    config = function()
      require("hlslens").setup()
    end,
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
    "mfussenegger/nvim-dap-python",
    lazy = false,
    config = function()
      require('dap-python').setup("python")
      local ppath = '${workspaceFolder}/env/Scripts/python'
      if vim.fn.filereadable(ppath) == 1 then
        require('dap').configurations.python = {
          {
            type = 'python',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            pythonPath = ppth,
            cwd = '${workspaceFolder}',
            justMyCode = false
          },
        }
      else 
        require('dap').configurations.python = {
          {
            type = 'python',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
            justMyCode = false
          },
        }
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  { "rcarriga/nvim-dap-ui", 
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    lazy = false,
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   dapui.close()
      -- end
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
      require'marks'.setup {
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { ".", "<", ">", "^" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions. 
        -- higher values will have better performance but may cause visual lag, 
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- disables mark tracking for specific buftypes. default {}
        excluded_buftypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = "⚑",
          virt_text = "hello world",
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          -- defaults to false.
          annotate = false,
        },
        mappings = {}
      }
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
  {
    "peterhoeg/vim-qml",
    lazy = false,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      leap = require('leap')
      -- leap.setup({})
      -- leap.create_default_mappings()
      vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
      vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
      vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    end
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "xiaodezhang/switch.nvim",
    lazy = false,
    config = function()
      require("switch").setup()
    end
  }
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
