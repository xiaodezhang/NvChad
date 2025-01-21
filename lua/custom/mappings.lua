---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-c>"] = { "\"*y", "yank", opts = { nowait = true } },
    ["<C-v>"] = { "\"*p", "paste", opts = { nowait = true } },
    ["*"] = { "*``", "highlight", opts = { nowait = true } },
    ["ma"] = { ": lua require('harpoon.mark').add_file() <CR>", "highlight", opts = { nowait = true } },
    ["mq"] = { ": lua require('harpoon.ui').toggle_quick_menu() <CR>", "highlight", opts = { nowait = true } },
    ["mn"] = { ": lua require('harpoon.ui').nav_next() <CR>", "highlight", opts = { nowait = true } },
    ["mp"] = { ": lua require('harpoon.ui').nav_prev() <CR>", "highlight", opts = { nowait = true } },
    ["<C-Up>"] = { ": res +2 <CR>", "highlight", opts = { nowait = true } },
    ["<C-Down>"] = { ": res -2 <CR>", "highlight", opts = { nowait = true } },
    ["<C-Left>"] = { ": vertical res +2 <CR>", "highlight", opts = { nowait = true } },
    ["<C-Right>"] = { ": vertical res -2 <CR>", "highlight", opts = { nowait = true } },

    ["<F3>"] = { function() require('dapui').open() end },
    ["<F4>"] = { function() require('dapui').close() end },
    ["<F5>"] = { function() require('dap').continue() end },
    ["<F6>"] = { function() require('dap').toggle_breakpoint() end },
    ["<F10>"] = { function() require('dap').step_over() end },
    ["<F11>"] = { function() require('dap').step_into() end },
    ["<F12>"] = { function() require('dap').step_out() end },
  },
  v = {
    ["<C-c>"] = { "\"*y", "yank", opts = { nowait = true } },
    ["<C-v>"] = { "\"*p", "paste", opts = { nowait = true } },
  }
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["ml"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}
-- more keybinds!
--
M.gitsigns = {
  n = {
    -- Actions
    ["<A-r>"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<A-p>"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<A-b>"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<A-d>"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

return M
