-- [[ Setting options ]]
-- NOTE: See `:help vim.opt`
-- For more options, you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.wrap = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.opt.hidden = false
vim.opt.swapfile = false
-- vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.vim/backup'
vim.opt.backupdir = os.getenv('HOME') .. '/.vim/undo'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
vim.opt.signcolumn = 'yes'
vim.opt.breakindent = true

vim.opt.timeoutlen = 500

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.confirm = true
