local vaults = vim.fn.expand '~/projects/agentic-development/vaults'
local workspaces = {}
if vim.fn.isdirectory(vaults) == 1 then
  for name, type in vim.fs.dir(vaults) do
    if type == 'directory' then
      table.insert(workspaces, { name = name, path = vaults .. '/' .. name })
    end
  end
end

return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  cond = #workspaces > 0,
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { legacy_commands = false, workspaces = workspaces },
}
