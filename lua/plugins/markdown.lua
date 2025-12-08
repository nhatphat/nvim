return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      opts.linters["markdownlint-cli2"] = {
        args = {
          "--config",
          vim.fn.expand("~/.config/nvim/lua/plugins/.markdownlint-cli2.jsonc"),
          "--",
        },
      }
      return opts
    end,
  },
}
