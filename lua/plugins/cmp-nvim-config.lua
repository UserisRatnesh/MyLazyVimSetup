-- To prioritize the custom code snippets defined first
--
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "mattn/emmet-vim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspconfig = require("lspconfig")

      -- Configure emmet-ls
      lspconfig["emmet_ls"].setup({
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript", "vue", "svelte" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        },

        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "emmet" },
        }),
      })
    end,
  },
}
