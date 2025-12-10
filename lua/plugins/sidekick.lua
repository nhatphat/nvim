return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      -- win = {
      --   keys = {
      --     prompt = {
      --       "<a-p>",
      --       "prompt",
      --       mode = "t",
      --       desc = "passthrough C-p to tool",
      --     },
      --   },
      -- },
      mux = {
        backend = "zellij",
        enabled = true,
      },
      tools = {
        amazon_q = {
          cmd = { "kiro-cli" },
        },
        opencode_teq = {
          cmd = { "opencode" },
          env = {
            -- HACK: https://github.com/sst/opencode/issues/445
            OPENCODE_THEME = "system",
            AWS_PROFILE = "cline-bedrock",
          },
          keys = { prompt = { "<a-p>", "prompt" } },
        },
      },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Apply or jump to next edit",
    },
  },
}
