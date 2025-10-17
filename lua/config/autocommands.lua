-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Global toggle for format on save
vim.g.format_on_save_enabled = true

-- Format on save for specific filetypes
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Format on save for specific filetypes',
  group = vim.api.nvim_create_augroup('format-on-save', { clear = true }),
  callback = function()
    -- Check if format on save is enabled
    if vim.g.format_on_save_enabled then
      vim.lsp.buf.format({ async = false })
    end
  end,
})


-- TODO: Needs work - currently doesn't load LSPs

-- -- Auto-restore persistence session
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'VeryLazy',
--   desc = 'Restore session for current directory',
--   group = vim.api.nvim_create_augroup('persistence-autoload', { clear = true }),
--   callback = function()
--     -- Only load session if nvim was started with no arguments
--     if vim.fn.argc(-1) == 0 then
--       require('persistence').load()
--     end
--   end,
-- })
