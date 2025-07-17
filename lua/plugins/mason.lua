-- File: lua/plugins/mason.lua
--
-- This file configures mason.nvim, which is a package manager for LSP servers,
-- DAP servers, linters, and formatters.

return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')

    -- Initialize mason
    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    -- Initialize mason-lspconfig
    mason_lspconfig.setup({
      -- A list of servers to automatically install if they're not already installed.
      -- This setting is optional.
      ensure_installed = {
        'ansiblels',
        'bashls',
        'cssls',
        'html',
        'jsonls',
        'lua_ls',
        'marksman',
        'pyright',
        'terraformls',
        'yamlls', -- For YAML and Ansible
      },
      -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
      -- This setting is optional.
      automatic_installation = true,
    })
  end,
}

