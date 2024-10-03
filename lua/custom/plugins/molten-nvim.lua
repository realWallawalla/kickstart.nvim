-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
vim.g.molten_auto_open_output = false
-- molten pip dependencies.
vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/neovim/bin/python3'

-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
vim.g.molten_image_provider = 'image.nvim'

-- optional, I like wrapping. works for virt text and the output window
vim.g.molten_wrap_output = true

-- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- be buggy with longer images
vim.g.molten_virt_text_output = true

-- this will make it so the output shows up below the \`\`\` cell delimiter
vim.g.molten_virt_lines_off_by_1 = true
return {
  'benlubas/molten-nvim',
  version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
  dependencies = { '3rd/image.nvim' },
  build = ':UpdateRemotePlugins',
  init = function()
    -- these are examples, not defaults. Please see the readme
    vim.g.molten_image_provider = 'image.nvim'
    vim.g.molten_output_win_max_height = 20
    vim.keymap.set('n', '<localleader>mi', ':MoltenInit<CR>', { desc = 'Molten: init for jupiter-notebook' })
    vim.keymap.set('n', '<localleader>e', ':MoltenEvaluateOperator<CR>', { desc = 'Molten: [e]valuate operator', silent = true })
    vim.keymap.set('n', '<localleader>os', ':noautocmd MoltenEnterOutput<CR>', { desc = 'Molten: open output window', silent = true })
    vim.keymap.set('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', { desc = 'Molten: re-eval cell', silent = true })
    vim.keymap.set('v', '<localleader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { desc = 'Molten: execute visual selection', silent = true })
    vim.keymap.set('n', '<localleader>oh', ':MoltenHideOutput<CR>', { desc = 'Molten: close output window', silent = true })
    vim.keymap.set('n', '<localleader>md', ':MoltenDelete<CR>', { desc = 'Molten: delete Molten cell', silent = true })

    -- if you work with html outputs:
    vim.keymap.set('n', '<localleader>mx', ':MoltenOpenInBrowser<CR>', { desc = 'Molten: open output in browser', silent = true })
  end,
}
