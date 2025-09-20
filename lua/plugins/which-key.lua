return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    icons = {
      mappings = vim.g.have_nerd_font,
    },
    spec = {
      -- { '<leader>a', group = '[A]vante' },
      { '<leader>b', group = '[B]uffer' },
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      -- { '<leader>d', group = '[D]ebug' },
      { '<leader>f', group = '[F]ile' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = '[H]unk (git)', mode = { 'n', 'v' } },
      -- { '<leader>l', group = '[L]og', mode = { 'n', 'v' } },
      { '<leader>n', group = '[N]otification' },
      -- { '<leader>p', group = '[P]roject' },
      { '<leader>q', group = '[Q]uit/Session' },
      -- { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>u', group = '[U]I' },
      { '<leader>w', group = '[W]indow' },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Which key?",
    },
  },
} 
