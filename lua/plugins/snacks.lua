local exclude_patterns = {
  -- Git
  ".git",
  -- JavaScript/Node
  "node_modules",
  -- Python
  ".venv",
  "venv",
  "__pycache__",
  ".pytest_cache",
  ".mypy_cache",
  ".ruff_cache",
  ".tox",
  "*.egg-info",
  ".eggs",
  ".ipynb_checkpoints",
  "htmlcov",
  ".hypothesis",
  -- IDE/Editor
  ".idea",
  ".vscode",
  ".DS_Store",
}

return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          -- ignored = true,
        },
        files = {
          hidden = true,
          ignored = true,
          exclude = exclude_patterns,
        },
        grep = {
          hidden = true,
          ignored = true,
          exclude = exclude_patterns,
        },
        grep_word = {
          hidden = true,
          ignored = true,
          exclude = exclude_patterns,
        },
        grep_buffers = {
          hidden = true,
          ignored = true,
          exclude = exclude_patterns,
        },
      },
    },
    -- terminal = {
    --   win = {
    --     position = "float",
    --     backdrop = false,
    --     border = "rounded",
    --   },
    -- },
  },
}
