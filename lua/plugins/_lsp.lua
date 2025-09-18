-- Mason + Native LSP Configuration for Neovim 0.11+
-- This replaces the need for nvim-lspconfig and mason-lspconfig

return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = { { '<leader>M', '<cmd>Mason<cr>', desc = '[*M*]ason' } },
    build = ':MasonUpdate',
    opts = {},
  },

  -- Automatically install tools
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        -- LSP Servers
        'lua-language-server',   -- Lua
        'typescript-language-server', -- TypeScript/JavaScript (for language features)
        'html-lsp',            -- HTML
        'css-lsp',             -- CSS
        'json-lsp',            -- JSON
        'yaml-language-server', -- YAML
        'bash-language-server', -- Bash
        -- 'pyright',              -- Python
        -- 'rust-analyzer',        -- Rust
        -- 'gopls',               -- Go
        -- 'clangd',              -- C/C++

        -- Formatters
        'biome',               -- TypeScript/JavaScript (for linting & formatting)
        'stylua',              -- Lua formatter
        -- 'black',               -- Python formatter
        -- 'rustfmt',             -- Rust formatter
        -- 'gofmt',               -- Go formatter
        -- 'clang-format',        -- C/C++ formatter

        -- Linters
        'shellcheck',          -- Shell script linter
        -- 'flake8',              -- Python linter
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

  -- LSP Configuration
  {
    name = 'native-lsp-config',
    dir = vim.fn.stdpath('config'),
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
          local optsWithDesc = function(desc) vim.tbl_extend(opts, { desc }) end
          
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
          
          -- Documentation
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          
          -- Diagnostics
          vim.keymap.set('n', '<C-k>', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', '<C-j>', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

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

      -- Enable the following language servers with default config
      local servers = {
        'lua-language-server',
        'ts_ls',      -- TypeScript Language Server (for language features)
        'biome',      -- Biome (for linting and formatting)
        'html',
        'cssls',
        'jsonls',
        'yamlls',
        'bashls',
        
        -- 'pyright', 
        -- 'rust_analyzer',
        -- 'gopls',
        -- 'clangd',
      }

      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}

