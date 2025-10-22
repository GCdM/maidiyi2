return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {
    -- Session directory
    dir = vim.fn.stdpath('state') .. '/sessions/',
    -- Minimum number of file buffers that need to be open to save
    need = 2,
    -- Use git branch in session name
    branch = true,
  },
  init = function()
    vim.schedule(function()
      require('persistence').load()
    end)
  end,
  keys = {
    {
      '<leader>qs',
      function() require('persistence').load() end,
      desc = '[Q]uit [S]ession Load Current Dir'
    },
    {
      '<leader>qS',
      function() require('persistence').select() end,
      desc = '[Q]uit [S]ession Select'
    },
    {
      '<leader>ql',
      function() require('persistence').load({ last = true }) end,
      desc = '[Q]uit Session [L]oad Last'
    },
    {
      '<leader>qd',
      function() require('persistence').stop() end,
      desc = '[Q]uit Session [D]on\'t Save'
    },
  },
}
