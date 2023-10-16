---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>y"] = { "\"*y", "yank", opts = { nowait = true } },
    ["<leader>p"] = { "\"*p", "paste", opts = { nowait = true } },
    ["*"] = { "*``", "highlight", opts = { nowait = true } },
    ["mf"] = { ": lua require('harpoon.mark').add_file() <CR>", "highlight", opts = { nowait = true } },
    ["mq"] = { ": lua require('harpoon.ui').toggle_quick_menu() <CR>", "highlight", opts = { nowait = true } },
    ["mn"] = { ": lua require('harpoon.ui').nav_next() <CR>", "highlight", opts = { nowait = true } },
    ["mp"] = { ": lua require('harpoon.ui').nav_prev() <CR>", "highlight", opts = { nowait = true } },
    ["<C-Up>"] = { ": res +2 <CR>", "highlight", opts = { nowait = true } },
    ["<C-Down>"] = { ": res -2 <CR>", "highlight", opts = { nowait = true } },
    ["<C-Right>"] = { ": vertical res +2 <CR>", "highlight", opts = { nowait = true } },
    ["<C-Left>"] = { ": vertical res -2 <CR>", "highlight", opts = { nowait = true } },
    -- ["ml"] = { ": MarksListAll <CR>", "highlight", opts = { nowait = true } },
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
