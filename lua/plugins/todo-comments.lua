-- lazy.lua or plugins configuration file
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({
        -- Customize keywords, colors, or signs if needed
        keywords = {
          TODO = { icon = " ", color = "info" },
          FIXME = { icon = " ", color = "error" },
          TOPIC = { icon = "➤ ", color = "#FF9E64" },
          NOTE = { icon = " ", color = "hint" },
          OPTIMAL = { icon = " ", color = "#98C379" },
          BRUTE = { icon = " ", color = "#E06C75" },
          HACK = { icon = " ", color = "#FFD700" },
          TC = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        },
      })
    end,
  },
}
