-- ctrl + b = Neotree toggle
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')
vim.keymap.set('n', '<leader>tc', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class()
  end
end)

vim.keymap.set('n', '<leader>tm', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method()
  end
end)
-- new line from normal mode. add above or below cursor
--vim.keymap.set('n', 'oo', 'o<Esc>k')
--vim.keymap.set('n', 'OO', 'O<Esc>j')
