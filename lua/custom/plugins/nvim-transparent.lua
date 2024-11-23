-- Autocmd for nvim-tree
vim.cmd 'autocmd Colorscheme * highlight NvimTreeNormal guibg=none guifg=#9da5b3'

return {
  'xiyaowong/nvim-transparent',
  config = function()
    require('transparent').setup {
      enable = true,
    }
    vim.cmd 'TransparentEnable' -- Run the TransparentEnable command on startup
  end,
}
