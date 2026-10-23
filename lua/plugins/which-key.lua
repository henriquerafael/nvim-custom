-- File: lua/plugins/which-key.lua
--
-- Configures which-key.nvim to display available keybindings in a popup.

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 300,
    spec = {
      { '<leader>b', group = '[B]uffer' },
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]iagnostics / [D]ocument' },
      { '<leader>f', group = '[F]ind (Telescope)' },
      { '<leader>g', group = '[G]it' },
      { '<leader>gh', group = '[G]it [H]unks' },
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]plit / [S]ource' },
      { '<leader>t', group = '[T]ab / [T]erminal' },
      { '<leader>w', group = '[W]orkspace / [W]rite' },
      { '<leader>x', group = 'Trouble / Diagnostics' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
