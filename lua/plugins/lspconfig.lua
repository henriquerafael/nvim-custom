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
  },

  config = function()
    -- Inicializa Mason e Mason-LSPConfig
    require("mason").setup()
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
        'yamlls',
      },
      automatic_installation = true,
    })

    --------------------------------------------------------------------------
    -- Função de inicialização comum (keymaps e formatação on save)
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
      map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('n', '[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
      map('n', ']d', vim.diagnostic.goto_next, 'Next Diagnostic')
      map('n', '<leader>df', vim.diagnostic.open_float, 'Diagnostic Float')
      map('n', '<leader>dq', vim.diagnostic.setloclist, 'Diagnostics Quickfix')

      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      if client:supports_method('textDocument/formatting') then
        local group = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    --------------------------------------------------------------------------
    -- Capabilities (autocompletar com nvim-cmp)
    --------------------------------------------------------------------------
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local root = vim.fs.root(0, { ".git", "package.json", "pyproject.toml" })

    --------------------------------------------------------------------------
    -- Configuração explícita de cada servidor
    --------------------------------------------------------------------------

    -- Ansible
    vim.lsp.config["ansiblels"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
    }

    -- Bash
    vim.lsp.config["bashls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
    }

    -- CSS
    vim.lsp.config["cssls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
    }

    -- HTML
    vim.lsp.config["html"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
    }

    -- JSON
    vim.lsp.config["jsonls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
    }

    -- Lua
    vim.lsp.config["lua_ls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
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
      root_dir = root,
    }

    -- Python
    vim.lsp.config["pyright"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
    }

    -- Terraform
    -- vim.lsp.config["terraformls"] = {
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- }

    vim.lsp.config["terraformls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
      settings = {
        terraform = {
          languageServer = {
            ignoreSingleFileWarning = true,
          },
        },
      },
    }

    vim.lsp.start(vim.lsp.config["terraformls"])

    -- YAML (com suporte a Ansible)
    vim.lsp.config["yamlls"] = {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = root,
      settings = {
        yaml = {
          schemas = {
            ['https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook'] =
            '/*{.ansible.yml,.ansible.yaml,playbook.yml}',
          },
        },
      },
    }

    --------------------------------------------------------------------------
    -- Inicializa todos os servidores declarados
    --------------------------------------------------------------------------
    vim.lsp.start(vim.lsp.config["ansiblels"])
    vim.lsp.start(vim.lsp.config["bashls"])
    vim.lsp.start(vim.lsp.config["cssls"])
    vim.lsp.start(vim.lsp.config["html"])
    vim.lsp.start(vim.lsp.config["jsonls"])
    vim.lsp.start(vim.lsp.config["lua_ls"])
    vim.lsp.start(vim.lsp.config["marksman"])
    vim.lsp.start(vim.lsp.config["pyright"])
    vim.lsp.start(vim.lsp.config["terraformls"])
    vim.lsp.start(vim.lsp.config["yamlls"])
  end,
}
