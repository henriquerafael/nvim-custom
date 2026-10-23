-- File: lua/plugins/lspconfig.lua
--
-- Configuração moderna do LSP usando vim.lsp.config (Neovim >= 0.11)
-- Integrado ao Mason, com servidores declarados explicitamente.

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'nvim-telescope/telescope.nvim',
    'b0o/SchemaStore.nvim',
  },

  config = function()
    --------------------------------------------------------------------------
    -- Função de inicialização comum (keymaps de LSP)
    -- Nota: A formatação on-save é gerenciada pelo conform.nvim (com fallback LSP)
    --------------------------------------------------------------------------
    local on_attach = function(client, bufnr)
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, {
          noremap = true,
          silent = true,
          buffer = bufnr,
          desc = 'LSP: ' .. desc,
        })
      end

      map('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      map('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('n', 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      map('n', '<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
      map('n', 'gK', vim.lsp.buf.signature_help, 'Signature Documentation')
      map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'Previous Diagnostic')
      map('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'Next Diagnostic')
      map('n', '<leader>df', vim.diagnostic.open_float, 'Diagnostic Float')
      map('n', '<leader>dq', vim.diagnostic.setloclist, 'Diagnostics Quickfix')

      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end

    --------------------------------------------------------------------------
    -- Capabilities (autocompletar com nvim-cmp)
    --------------------------------------------------------------------------
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local schemastore_ok, schemastore = pcall(require, 'schemastore')

    --------------------------------------------------------------------------
    -- Configuração explícita de cada servidor
    --------------------------------------------------------------------------

    -- Ansible
    vim.lsp.config["ansiblels"] = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- Bash
    vim.lsp.config["bashls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- CSS
    vim.lsp.config["cssls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- HTML
    vim.lsp.config["html"] = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- JSON (integrado ao SchemaStore.nvim)
    vim.lsp.config["jsonls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = schemastore_ok and schemastore.json.schemas() or {},
          validate = { enable = true },
        },
      },
    }

    -- Lua
    vim.lsp.config["lua_ls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    }

    -- Markdown
    vim.lsp.config["marksman"] = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- Python
    vim.lsp.config["pyright"] = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- Terraform
    -- vim.lsp.config["terraformls"] = {
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- }

    vim.lsp.config["terraformls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        terraform = {
          languageServer = {
            ignoreSingleFileWarning = true,
          },
        },
      },
    }

    -- YAML (integrado ao SchemaStore.nvim + suporte a Ansible)
    local yaml_schemas = schemastore_ok and schemastore.yaml.schemas() or {}
    yaml_schemas['https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook'] =
      '/*{.ansible.yml,.ansible.yaml,playbook.yml}'

    vim.lsp.config["yamlls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        yaml = {
          schemaStore = {
            -- Desabilita o schema store embutido para usar o b0o/SchemaStore.nvim
            enable = false,
            url = "",
          },
          schemas = yaml_schemas,
        },
      },
    }

    --------------------------------------------------------------------------
    -- Habilita os servidores declarados sob demanda por FileType
    --------------------------------------------------------------------------
    vim.lsp.enable({
      "ansiblels",
      "bashls",
      "cssls",
      "html",
      "jsonls",
      "lua_ls",
      "marksman",
      "pyright",
      "terraformls",
      "yamlls",
    })
  end,
}
