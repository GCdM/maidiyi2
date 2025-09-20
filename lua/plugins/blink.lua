return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',

  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    keymap = { preset = 'super-tab' },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      nerd_font_variant = vim.g.have_nerd_font and 'mono' or 'normal'
    },

    -- Default list of enabled providers
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- Experimental signature help support
    signature = { enabled = true },

    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        -- Don't automatically show completion menu
        auto_show = true,
        draw = {
          treesitter = { "lsp" }
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },

    -- Experimental snippets support
    snippets = {
      expand = function(snippet) vim.snippet.expand(snippet) end,
      active = function(filter)
        if filter and filter.direction then
          return vim.snippet.active({ direction = filter.direction })
        end
        return vim.snippet.active()
      end,
      jump = function(direction) vim.snippet.jump(direction) end,
    },
  },
  opts_extend = { "sources.default" }
}

