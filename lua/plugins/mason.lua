-- File: lua/plugins/mason.lua
--
-- Configuração do mason.nvim: gerencia servidores LSP, DAP, linters e formatadores.

return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
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

    require("mason-tool-installer").setup({
      ensure_installed = {
        'prettier',
        'ruff',
        'shellcheck',
        'shfmt',
        'stylua',
        'tflint',
        'yamllint',
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}

