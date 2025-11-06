-- [[ Setting options ]]
-- NOTE: See `:help vim.opt`
-- For more options, you can see `:help option-list`

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- Create and set backup/undo directories
local function ensure_dir(path)
	if vim.fn.isdirectory(path) == 0 then
		vim.fn.mkdir(path, "p")
	end
	return path
end

vim.opt.undodir = ensure_dir(os.getenv("HOME") .. "/.vim/undo")
vim.opt.backupdir = ensure_dir(os.getenv("HOME") .. "/.vim/backup")

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.laststatus = 2 -- 2 = always, 3 = only focused window
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
vim.opt.signcolumn = "yes"
vim.opt.breakindent = true

vim.opt.timeoutlen = 500

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.confirm = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false -- Don't fold by default when opening files
vim.opt.foldlevel = 99 -- High value to open most folds by default
