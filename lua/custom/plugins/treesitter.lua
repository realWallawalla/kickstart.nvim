local treesitter_langs = {
  'bash',
  'c',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'vim',
  'vimdoc',
  'markdown_inline',
  'python',
  'java',
  'terraform',
  'yaml',
  'json',
  'kotlin',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      ensure_installed = treesitter_langs,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      textobjects = {
        -- ... keep your existing textobjects config here ...
      },
    },
    config = function(_, opts)
      -- Fix: The old 'nvim-treesitter.configs' is gone.
      -- We now use the main module's setup.
      require('nvim-treesitter').setup(opts)

      -- Optional: prefer git for installs
      require('nvim-treesitter.install').prefer_git = true
    end,
  },
}
