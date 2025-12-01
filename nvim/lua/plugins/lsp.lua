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
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function ()
        require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function ()
        require("mason-lspconfig").setup()
    end
  }
}
