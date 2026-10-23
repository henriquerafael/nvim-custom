-- File: lua/plugins/conform.lua
--
-- Configures conform.nvim for fast, reliable code formatting with LSP fallback.

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = { 'n', 'v' },
      desc = '[C]ode [F]ormat',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_format', 'black', stop_after_first = true },
      sh = { 'shfmt' },
      bash = { 'shfmt' },
      terraform = { 'terraform_fmt' },
      tf = { 'terraform_fmt' },
      ['terraform-vars'] = { 'terraform_fmt' },
      yaml = { 'prettier' },
      json = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      markdown = { 'prettier' },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = 'fallback',
    },
  },
}
