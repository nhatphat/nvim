return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.g.lazyvim_python_lsp = "ty"
      vim.g.lazyvim_python_ruff = "ruff"

      opts.servers = opts.servers or {}

      opts.servers.ty = {
        settings = {
          ty = {
            diagnosticMode = "openFilesOnly",
            configuration = {
              rules = {
                ["unused-ignore-comment"] = "warn",
              },
            },
            inlayHints = {
              variableTypes = false,
              callArgumentNames = false,
            },
          },
        },
      }
    end,
  },
}
