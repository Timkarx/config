vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>y", "\"+y" )
vim.keymap.set("v", "<leader>y", "\"+y" )
vim.keymap.set("n", "<leader>p", "\"+p" )
vim.keymap.set("v", "<leader>p", "\"+p" )

vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
