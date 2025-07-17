-- File: lua/plugins/lspconfig.lua
--
-- This file configures nvim-lspconfig, the core plugin for setting up
-- Language Server Protocol (LSP) clients.

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- These are required for the LSP setup
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- nvim-cmp dependencies are listed in cmp.lua
  },
  config = function()
    -- This function will be called for each server that is set up.
    -- It defines the keymaps that will be available in buffers with an active LSP client.
    local on_attach = function(client, bufnr)
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = 'LSP: ' .. desc })
      end

      -- LSP keymappings
      map('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      map('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('n', 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      map('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
      map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

      -- Diagnostic keymaps
      map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic')
      map('n', ']d', vim.diagnostic.goto_next, 'Go to next diagnostic')
      map('n', '<leader>de', vim.diagnostic.open_float, 'Show diagnostic error messages')
      map('n', '<leader>dq', vim.diagnostic.setloclist, 'Open diagnostic quickfix list')

      -- Set other LSP options on attach
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Format on save, if the language server supports it
      if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = vim.api.nvim_create_augroup('LspFormatting', {}), buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = vim.api.nvim_create_augroup('LspFormatting', {}),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    -- Get the list of servers to setup from mason-lspconfig
    local servers = require('mason-lspconfig').get_installed_servers()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Loop through the servers and set them up
    for _, server_name in ipairs(servers) do
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- Special setup for yamlls to recognize ansible files
    lspconfig.yamlls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = {
            ['https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook'] =
            '/*{.ansible.yml,.ansible.yaml,playbook.yml}',
          },
        },
      },
    })
  end,
}
