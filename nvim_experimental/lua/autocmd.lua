local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = {"javascript", "typescript"},
  callback = function()
    local root_dir = vim.fs.root(0, {"package.json"})
    local lsp_id = vim.lsp.start({
      name = "typescript-language-server",
      cmd = {"/home/timkarx7/.nvm/versions/node/v20.6.1/bin/typescript-language-server", "--stdio"},
      root_dir = root_dir
    })
    vim.lsp.buf_attach_client(0, lsp_id)
    print("LSP Initalization successful")
  end
})

local prettier_autocmd = vim.api.nvim_create_autocmd
prettier_autocmd("BufWritePost", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
  callback = function(args)
    local buf = args.buf
    local filepath = vim.api.nvim_buf_get_name(buf)

    if vim.fn.filereadable(filepath) == 1 then
      vim.system({"prettier", "--write", filepath}, {text = true},
        function()
          vim.schedule(function() vim.cmd("e!") end)
        end
      )
      print("Great success")
    else
      print("Filepath not readable")
    end
  end
})
