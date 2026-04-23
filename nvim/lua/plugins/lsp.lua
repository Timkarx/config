return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" },
      })

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "x" }, "<F3>", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
      end

      vim.lsp.config('*', {
        on_attach = on_attach
      })

      vim.lsp.config("clangd", {
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--compile-commands-dir=build-release",
        },
      })

      local function ts_root_dir(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local dir = vim.fs.root(fname, { "tsconfig.json", "jsconfig.json" })
          or vim.fs.root(fname, { "package.json" })
        print(dir)
        on_dir(dir)
      end

      vim.lsp.config("ts_ls", {
        root_dir = ts_root_dir,
        on_attach = on_attach
      })
    end,
  },
}
