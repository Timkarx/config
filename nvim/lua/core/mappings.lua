vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>y", "\"+y" )
vim.keymap.set("v", "<leader>y", "\"+y" )
vim.keymap.set("n", "<leader>p", "\"+p" )
vim.keymap.set("v", "<leader>p", "\"+p" )

vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)


vim.api.nvim_create_user_command("DedupQF", function()
  local seen = {}
  local new_qf = {}

  for _, item in ipairs(vim.fn.getqflist()) do
    local key = string.format("%d:%d", item.bufnr, item.lnum)
    if not seen[key] then
      seen[key] = true
      table.insert(new_qf, item)
    end
  end

  vim.fn.setqflist(new_qf)
end, {})
