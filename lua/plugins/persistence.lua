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
  config = function(_, opts)
    require('persistence').setup(opts)

    -- Auto-restore session for current directory
    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('persistence_autoload', { clear = true }),
      callback = function()
        -- Only load the session if nvim was started with no arguments
        if vim.fn.argc(-1) == 0 then
          require('persistence').load()
        end
      end,
      nested = true,
    })
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