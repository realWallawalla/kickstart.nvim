return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    workspaces = {
      -- TODO: set your vault path
      { name = 'notes', path = '~/Documents/Notes' },
    },
  },
}
