-- File: lua/plugins/toggleterm.lua
--
-- This file configures toggleterm.nvim, a plugin for managing
-- and toggling terminals within Neovim.

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      -- Size of the terminal window
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
        return 20
      end,
      -- Open a terminal with a specific mapping
      open_mapping = [[<c-\>]],
      -- Shade the terminal windows
      shade_terminals = true,
      -- Start in insert mode
      start_in_insert = true,
      -- Persist the terminal buffer
      persist_size = true,
      direction = 'float',
      close_on_exit = true, -- Close the terminal window when the process exits
      float_opts = {
        -- Options for floating terminals
        border = 'curved',
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- --- Custom Keymaps for Terminals ---
    local keymap = vim.keymap
    local Terminal = require('toggleterm.terminal').Terminal

    -- Function to create a terminal for a specific command
    local function create_term(command, direction)
      local term = Terminal:new({
        cmd = command,
        dir = vim.fn.getcwd(),
        direction = direction,
        float_opts = {
          border = 'curved',
        },
        on_open = function(t)
          vim.cmd('startinsert!')
        end,
      })

      return function()
        term:toggle()
      end
    end

    -- Lazygit terminal
    -- This creates a floating terminal specifically for lazygit
    keymap.set('n', '<leader>gg', create_term('lazygit', 'float'), { desc = '[G]it [G]ui (lazygit)' })

    -- Node terminal
    keymap.set('n', '<leader>tn', create_term('node', 'float'), { desc = '[T]erminal [N]ode' })

    -- Python terminal
    keymap.set('n', '<leader>tp', create_term('python', 'float'), { desc = '[T]erminal [P]ython' })

    -- Horizontal terminal
    keymap.set('n', '<leader>th', create_term(nil, 'horizontal'), { desc = '[T]erminal [H]orizontal' })

    -- Vertical terminal
    keymap.set('n', '<leader>tv', create_term(nil, 'vertical'), { desc = '[T]erminal [V]ertical' })
  end,
}
