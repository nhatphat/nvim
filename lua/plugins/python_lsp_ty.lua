return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.g.lazyvim_python_lsp = "ty"
      vim.g.lazyvim_python_ruff = "ruff"

      -- Auto detect .venv
      local function get_python_path(workspace)
        if vim.fn.isdirectory(workspace .. "/.venv") == 1 then
          return workspace .. "/.venv/bin/python"
        elseif vim.fn.isdirectory(workspace .. "/venv") == 1 then
          return workspace .. "/venv/bin/python"
        else
          return vim.fn.exepath("python3")
        end
      end

      opts.servers = opts.servers or {}
      opts.servers.pyright = nil

      opts.servers.ty = {
        settings = {
          ty = {
            diagnosticMode = "openFilesOnly",
            configuration = {
              python = get_python_path(vim.fn.getcwd()),

              rules = {
                ["unused-ignore-comment"] = "warn",
              },
            },
          },
        },
      }
    end,
  },
}
