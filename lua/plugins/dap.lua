return {

  --
  -- Debug Adapter Protocol
  --

  {
    'mfussenegger/nvim-dap',

    config = function()
      local dap = require('dap')

      vim.keymap.set('n', '<F8>', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<F9>', dap.continue, {})
      vim.keymap.set('n', '<F10>', dap.step_over, {})
      vim.keymap.set('n', '<F11>', dap.step_into, {})
    end
  },

  --
  -- User Interface
  --

  {
    'rcarriga/nvim-dap-ui',

    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },

    config = function()
      local dapui = require('dapui')
      local dap = require('dap')

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  --
  -- User Interface
  --

  {
    'rcarriga/nvim-dap-ui',

    config = function()
      local dapui = require('dapui')
      local dap = require('dap')

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  --
  -- Virtual Text
  --

  {
    'theHamsta/nvim-dap-virtual-text'
  },

  --
  -- Debug Adapter Protocol Python
  --

  {
    'mfussenegger/nvim-dap-python',

    config = function()
      -- HACK: Hard coded python interpreter!
      -- INFO: .setup(os.getenv("VIRTUAL_ENV") .. "/bin/python")
      require('dap-python').setup('~/Entwicklung/.venv/Scripts/python.exe')
    end

  }
}
