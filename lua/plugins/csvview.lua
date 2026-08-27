return {
  {
    "hat0uma/csvview.nvim",
    ft = { "csv", "tsv" },
    opts = {
      parser = {
        comments = { "#", "//" },
      },
      view = {
        display_mode = "border",
      },
    },
    config = function(_, opts)
      require("csvview").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "csv", "tsv" },
        callback = function()
          vim.cmd("CsvViewEnable")
        end,
      })

      vim.api.nvim_create_user_command("CsvEncoding", function()
        local encodings = {
          "utf-8",
          "cp932",
          "euc-jp",
          "iso-2022-jp",
        }

        vim.ui.select(encodings, {
          prompt = "CSV encoding:",
        }, function(enc)
          if not enc then
            return
          end

          vim.cmd("edit ++enc=" .. enc .. " %")
        end)
      end, {})
    end,
    keys = {
      {
        "<leader>cv",
        "<cmd>CsvViewToggle<cr>",
        desc = "Toggle CSV View",
      },
      {
        "<leader>ce",
        "<cmd>CsvEncoding<cr>",
        desc = "CSV Encoding",
      },
    },
  },
}
