-- Molten: interactive code execution with Jupyter kernels inside Neovim.
--
-- Prerequisites (install globally via pyenv, not in a venv):
--   pip install pynvim jupyter_client ipykernel
--   python -m ipykernel install --user
--
-- NOTE: If you upgrade your pyenv python version, re-run the two
-- commands above. The kernel spec hardcodes the python path and
-- will break after a version change.
--
-- After first install or update, run inside Neovim:
--   :UpdateRemotePlugins
-- Then restart Neovim.
--
-- Usage: open a file, run <localleader>mi to init a kernel, then use
-- the keybinds below to evaluate code.
--
-- Keybinds (all start with <localleader>m):
--   mi  - init kernel
--   me  - evaluate with motion (e.g. meip for inner paragraph)
--   ml  - evaluate current line
--   mr  - re-evaluate cell (normal) / evaluate selection (visual)
--   ma  - re-evaluate all cells
--   mn  - jump to next cell
--   mp  - jump to previous cell
--   mo  - open/enter output window
--   mh  - hide output window
--   md  - delete cell
--   mk  - interrupt (kill) running cell
--   ms  - save cell outputs
--   mL  - load saved outputs
--   mR  - restart kernel and clear outputs
--   mx  - open html output in browser

return {
  'benlubas/molten-nvim',
  version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
  dependencies = { '3rd/image.nvim' },
  build = ':UpdateRemotePlugins',
  init = function()
    vim.g.molten_auto_open_output = false
    vim.g.molten_image_provider = 'image.nvim'
    vim.g.molten_wrap_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_output_win_max_height = 20

    -- Kernel lifecycle
    vim.keymap.set('n', '<localleader>mi', ':MoltenInit<CR>', { desc = 'Molten: init kernel', silent = true })
    vim.keymap.set('n', '<localleader>mR', ':MoltenRestart!<CR>', { desc = 'Molten: restart kernel + clear outputs', silent = true })
    vim.keymap.set('n', '<localleader>mk', ':MoltenInterrupt<CR>', { desc = 'Molten: interrupt running cell', silent = true })

    -- Evaluate code
    vim.keymap.set('n', '<localleader>me', ':MoltenEvaluateOperator<CR>', { desc = 'Molten: evaluate operator', silent = true })
    vim.keymap.set('n', '<localleader>ml', ':MoltenEvaluateLine<CR>', { desc = 'Molten: evaluate line', silent = true })
    vim.keymap.set('n', '<localleader>mr', ':MoltenReevaluateCell<CR>', { desc = 'Molten: re-evaluate cell', silent = true })
    vim.keymap.set('v', '<localleader>mr', ':<C-u>MoltenEvaluateVisual<CR>gv', { desc = 'Molten: evaluate visual selection', silent = true })

    -- Navigation
    vim.keymap.set('n', '<localleader>mn', ':MoltenNext<CR>', { desc = 'Molten: next cell', silent = true })
    vim.keymap.set('n', '<localleader>mp', ':MoltenPrev<CR>', { desc = 'Molten: previous cell', silent = true })

    -- Output
    vim.keymap.set('n', '<localleader>mo', ':noautocmd MoltenEnterOutput<CR>', { desc = 'Molten: open/enter output', silent = true })
    vim.keymap.set('n', '<localleader>mh', ':MoltenHideOutput<CR>', { desc = 'Molten: hide output', silent = true })
    vim.keymap.set('n', '<localleader>mx', ':MoltenOpenInBrowser<CR>', { desc = 'Molten: open in browser', silent = true })

    -- Cell management
    vim.keymap.set('n', '<localleader>md', ':MoltenDelete<CR>', { desc = 'Molten: delete cell', silent = true })
    vim.keymap.set('n', '<localleader>ms', ':MoltenSave<CR>', { desc = 'Molten: save outputs', silent = true })
    vim.keymap.set('n', '<localleader>mL', ':MoltenLoad<CR>', { desc = 'Molten: load outputs', silent = true })
  end,
}
