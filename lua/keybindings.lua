-- ctrl + b = Neotree toggle
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

-- Prettify JSON with jq
vim.keymap.set('n', '<leader>jq', ':%!jq .<CR>', { desc = 'Prettify JSON' })
vim.keymap.set('v', '<leader>jq', ":'<,'>!jq .<CR>", { desc = 'Prettify JSON selection' })
