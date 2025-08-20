return {
  'sbdchd/neoformat',
  config= function()
        vim.g.neoformat_rust_rustfmt = {
            exe = "rustfmt",
            args = { "--edition", " 2024" },
            stdin = 1,
        }
  end
}
