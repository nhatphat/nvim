return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.g.lazyvim_python_lsp = "pyright"
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
      opts.servers.pyright = {
        on_attach = function(client, bufnr)
          -- Filter out specific pyright diagnostics
          local ignored_diagnostics = {
            "reportAttributeAccessIssue",
            "reportCallIssue",
            -- Add more diagnostic codes here to ignore, e.g.:
            -- "reportGeneralTypeIssues",
            -- "reportOptionalMemberAccess",
          }

          local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
          vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
            if result and result.diagnostics then
              result.diagnostics = vim.tbl_filter(function(diagnostic)
                return not vim.tbl_contains(ignored_diagnostics, diagnostic.code)
              end, result.diagnostics)
            end
            orig_handler(err, result, ctx, config)
          end
        end,
        settings = {
          python = {
            pythonPath = get_python_path(vim.fn.getcwd()),
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      }
    end,
  },
}
