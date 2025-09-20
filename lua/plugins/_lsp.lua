-- LSP Configuration with nvim-lspconfig and Mason

return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = { { '<leader>M', '<cmd>Mason<cr>', desc = '[*M*]ason' } },
    build = ':MasonUpdate',
    opts = {},
  },

  -- Bridge between Mason and native LSP (Neovim 0.11+)
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'lua_ls',
        'ts_ls',
        'html',
        'cssls',
        'jsonls',
        'yamlls',
        'bashls',
        -- 'pyright',
        -- 'rust_analyzer',
        -- 'gopls',
        -- 'clangd',
      },
      automatic_installation = true,
    },
  },

  -- Automatically install tools
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        -- LSP Servers
        'lua-language-server',        -- Lua
        'typescript-language-server', -- TypeScript/JavaScript (for language features)
        'html-lsp',                   -- HTML
        'css-lsp',                    -- CSS
        'json-lsp',                   -- JSON
        'yaml-language-server',       -- YAML
        'bash-language-server',       -- Bash

        -- Formatters
        'biome',                      -- TypeScript/JavaScript (for linting & formatting)
        'stylua',                     -- Lua formatter

        -- Linters
        'shellcheck',                 -- Shell script linter
      },
      auto_update = false,
      run_on_start = true,
    },
  },

  -- Enhanced LSP UI
  {
    'j-hui/fidget.nvim',
    opts = {
      notification = {
        window = {
          winblend = 100,
        },
      },
    },
  },

  -- Native LSP Configuration (Neovim 0.11+)
  {
    name = 'native-lsp-config',
    dir = vim.fn.stdpath('config'),
    lazy = false,
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    keys = {
      { '<leader>ls', function() vim.print(vim.lsp.get_clients()) end, desc = '[L]SP [S]ervers' },
      { '<leader>lb', function() vim.print(vim.lsp.get_clients({ bufnr = 0 })) end, desc = '[L]SP Attached to [B]uffer' },
    },
    config = function()
      -- Global LSP configuration that applies to all servers
      vim.lsp.config('*', {
        on_attach = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })
          vim.api.nvim_set_option_value('tagfunc', 'v:lua.vim.lsp.tagfunc', { buf = bufnr })

          -- Buffer local mappings
          local opts = { buffer = bufnr, silent = false }
          local optsWithDesc = function(desc) return vim.tbl_extend('force', opts, { desc = desc }) end

          -- Navigation
          vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, optsWithDesc('[G]oto [S]ignature Help'))

          -- Actions
          vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, optsWithDesc('[C]ode [R]ename'))
          vim.keymap.set(
            {'n', 'x'},
            '<leader>ff',
            function() vim.lsp.buf.format({ async = true }) end,
            optsWithDesc('[F]ile [F]ormat')
          )
          vim.keymap.set({'n', 'x'}, '<leader>ca', vim.lsp.buf.code_action, optsWithDesc('[C]ode [A]ction'))

          -- Note: 'K' is automatically mapped to vim.lsp.buf.hover() by Neovim

          -- Note: Diagnostic keymaps are defined globally in config/keymaps.lua
          -- to avoid duplication and provide consistent behavior across buffers

          -- Highlight the symbol and its references when holding the cursor
          if client.supports_method('textDocument/documentHighlight') then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = bufnr,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,

        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })

      -- Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          prefix = '●',
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = false,
          style = 'minimal',
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
        },
      })

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = '✘', Warn = '▲', Hint = '⚑', Info = '»' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      -- Setup language servers with custom configurations from /lsp/ directory
      local servers = {
        'lua_ls',
        'biome',
        'ts_ls',
        'html',
        'cssls',
        'jsonls',
        'yamlls',
        'bashls',
      }

      for _, server in ipairs(servers) do
        local config_path = 'lsp.' .. server
        local ok, custom_config = pcall(require, config_path)

        if ok then
          -- Use custom configuration
          vim.lsp.config(server, custom_config)
        else
          -- Use default configuration
          vim.lsp.config(server, {})
        end

        -- Enable the server
        vim.lsp.enable(server)
      end
    end,
  },
}