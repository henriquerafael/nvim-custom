-- File: lua/plugins/mason.lua
--
-- Configuração do mason.nvim: gerencia servidores LSP, DAP, linters e formatadores.

return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    require("mason-lspconfig").setup({
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
        'yamlls', -- YAML e Ansible
      },
      automatic_installation = true,
    })
  end,
}

