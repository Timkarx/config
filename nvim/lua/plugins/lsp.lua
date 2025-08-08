return {
  -- Autocompletion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     {'L3MON4D3/LuaSnip'},
  --   },
  --   config = function()
  --     local cmp = require('cmp')

  --     cmp.setup({
  --       sources = {
  --         {name = 'nvim_lsp'},
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --     ['<CR>'] = cmp.mapping.confirm({select = false}),
  --         ['<C-Space>'] = cmp.mapping.complete(),
  --         ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  --         ['<C-d>'] = cmp.mapping.scroll_docs(4),
  --       }),
  --       snippet = {
  --         expand = function(args)
  --           vim.snippet.expand(args.body)
  --         end,
  --       },
  --     })
  --   end
  -- },

  -- LSP
  {
    'neovim/nvim-lspconfig',
  },
  { "williamboman/mason.nvim",
    version = "^1.0.0",
    config = function ()
      require('mason').setup({})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = { "mason.nvim" },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {'lua_ls', 'rust_analyzer'},
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end
  }
}
