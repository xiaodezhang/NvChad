local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "cpp",
    "python",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "pyright",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- project support in nvimtree
M.nvimtree = {
  respect_buf_cwd = true,
  update_focused_file = {
    update_root = true
  },
}

-- nvim-ts-rainbow2 support in nvim-treesitter
-- M.treesitter = {
--
--   rainbow = {
--    enable = true,
--     -- list of languages you want to disable the plugin for
--     disable = { 'jsx', 'cpp' },
--     -- Which query to use for finding delimiters
--     query = 'rainbow-parens',
--     -- Highlight the entire buffer all at once
--     strategy = require('ts-rainbow').strategy.global,
--
--   },
-- }

return M
