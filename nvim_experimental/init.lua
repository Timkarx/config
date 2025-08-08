require("autocmd")
vim.cmd[[colorscheme evening]]

-- TODO: Remove this later
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function() vim.lsp.start({
	    name = "rust-analyzer",
	    cmd = { "/home/timkarx7/.local/bin/rust-analyzer" },
	    root_dir = vim.fn.getcwd(),
	})
	end
})
