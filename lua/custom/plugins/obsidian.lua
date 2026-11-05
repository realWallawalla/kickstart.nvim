return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    local vaults = vim.fn.expand '~/projects/agentic-development/vaults'
    local workspaces = {}
    for name, type in vim.fs.dir(vaults) do
      if type == 'directory' then
        table.insert(workspaces, { name = name, path = vaults .. '/' .. name })
      end
    end
    return { legacy_commands = false, workspaces = workspaces }
  end,
}
