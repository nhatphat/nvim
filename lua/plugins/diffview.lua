return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggle", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
      { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    },
    opts = {},
  },
}
