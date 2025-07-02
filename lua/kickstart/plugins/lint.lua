return {
  -- Linters should be added in init.lua linters list in mason config
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        javascript = { 'eslint_d' },
        typescript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
        json = { 'eslint_d' },
        html = { 'eslint_d' },
        svelte = { 'eslint_d' },
        yaml = { 'eslint_d' },
        css = { 'eslint_d' },
        graphql = { 'eslint_d' },
        python = { 'pylint' },
        bash = { 'shellcheck' },
      }
      -- If you would like to enable other plugins to use linting see kickstarter config on how to do it.

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
