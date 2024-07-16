-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',

    'nvim-telescope/telescope-dap.nvim', -- telescope integration with dap

    'theHamsta/nvim-dap-virtual-text', -- inline variable text while debugging
  },
  opts = {
    controls = {
      element = 'repl',
      enabled = false,
      icons = {
        disconnect = '',
        pause = '',
        play = '',
        run_last = '',
        step_back = '',
        step_into = '',
        step_out = '',
        step_over = '',
        terminate = '',
      },
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = 'single',
      mappings = {
        close = { 'q', '<Esc>' },
      },
    },
    force_buffers = true,
    icons = {
      collapsed = '',
      current_frame = '',
      expanded = '',
    },
    layouts = {
      {
        elements = {
          {
            id = 'scopes',
            size = 0.50,
          },
          {
            id = 'stacks',
            size = 0.30,
          },
          {
            id = 'watches',
            size = 0.10,
          },
          {
            id = 'breakpoints',
            size = 0.10,
          },
        },
        size = 40,
        position = 'left', -- Can be "left" or "right"
      },
      {
        elements = {
          'repl',
          'console',
        },
        size = 10,
        position = 'bottom', -- Can be "bottom" or "top"
      },
    },
    mappings = {
      edit = 'e',
      expand = { '<CR>', '<2-LeftMouse>' },
      open = 'o',
      remove = 'd',
      repl = 'r',
      toggle = 't',
    },
    render = {
      indent = 1,
      max_value_lines = 100,
    },
  },
  config = function(_, opts)
    local dap = require 'dap'
    require('dapui').setup(opts)

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
        'java-debug-adapter',
        'java-test',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    dap.listeners.after.event_initialized['dapui_config'] = function()
      require('dapui').open()
    end

    dap.listeners.before.event_terminated['dapui_config'] = function()
      -- Commented to prevent DAP UI from closing when unit tests finish
      -- require('dapui').close()
    end

    dap.listeners.before.event_exited['dapui_config'] = function()
      -- Commented to prevent DAP UI from closing when unit tests finish
      -- require('dapui').close()
    end

    -- Add dap configurations based on your language/adapter settings
    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    dap.configurations.java = {
      {
        name = 'Debug Launch (2GB)',
        type = 'java',
        request = 'launch',
        vmArgs = '' .. '-Xmx2g ',
      },
      {
        name = 'Debug Attach (8000)',
        type = 'java',
        request = 'attach',
        hostName = '127.0.0.1',
        port = 8000,
      },
      {
        name = 'Debug Attach (5005)',
        type = 'java',
        request = 'attach',
        hostName = '127.0.0.1',
        port = 5005,
      },
    }
    vim.keymap.set('n', '<F7>', require('dapui').toggle, { desc = 'Debug: See last session result.' })

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }
  end,
}
