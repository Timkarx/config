local prettier_autocmd = vim.api.nvim_create_autocmd
prettier_autocmd("BufWrite", {
    pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
    callback = function(args)
        local buf = args.buf
        local filepath = vim.api.nvim_buf_get_name(buf)

        if vim.fn.filereadable(filepath) == 1 then
            vim.system({"prettier", "--write", filepath}, {text = true})
            print("Great success")
        else
            print("Filepath not readable")
        end
    end
})
