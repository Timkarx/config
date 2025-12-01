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
    config = function ()
      local opts = {buffer = bufnr}
      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
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
