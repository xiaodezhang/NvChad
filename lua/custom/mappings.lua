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
    ["<F5>"] = { function() require('dap').continue() end },
    ["<F10>"] = { function() require('dap').step_over() end },
    ["<F11>"] = { function() require('dap').step_into() end },
    ["<F12>"] = { function() require('dap').step_out() end },
    ["<A-b>"] = { function() require('dap').toggle_breakpoint() end },
    ["<A-o>"] = { function() require('dapui').open() end },
    ["<A-c>"] = { function() require('dapui').close() end },
    ["<A-l>"] = { function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },

    ["<A-r>"] = { function() require('dap').run_last() end },
    ["<A-h>"] = { function() require('dap.ui.widgets').hover() end },
    ["<A-p>"] = { function() require('dap.ui.widgets').preview() end },
    ["<A-f>"] = {
      function() 
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames) 
      end 
    },
    ["<A-s>"] = {
      function() 
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes) 
      end 
    },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["ml"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}
-- more keybinds!

return M
