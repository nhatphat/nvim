return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true, -- Enable inline blame
    current_line_blame_opts = {
      delay = 1000, -- Show after 1000ms idle
      virt_text = true, -- Display blame inline
      virt_text_pos = "eol", -- Position at end of line
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
  },
}

