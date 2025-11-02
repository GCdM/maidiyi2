-- [[ Basic Keymaps ]]
-- NOTE: See `:help vim.keymap.set()`
-- Sets up keymaps that only rely on `vim`/`neovim` builtins.
-- Keymaps relying on plugins are set within those plugins.

local map = vim.keymap.set

map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- map({ "i", "x", "n", "s" }, "<C-S-s>", "<cmd>noautocmd w<cr><esc>", { desc = "Save without formatting" })
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "[*Q*]uit All" })
map("n", "<leader>D", "<cmd>:bd<cr>", { desc = "[*D*]rop buffer & window" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights on search when pressing <Esc> in normal mode

-- System clipboard operations (keeping vim register separate)
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map("n", "<C-S-a>", "<cmd>%y+<cr>", { desc = "Copy entire buffer to system clipboard" })
map("v", "<C-S-x>", '"+d', { desc = "Cut to system clipboard" })

-- Yank file paths to system clipboard
map("n", "<leader>yp", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Yank relative file path" })
map("n", "<leader>yP", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Yank absolute file path" })
map("n", "<leader>yf", function()
	local path = vim.fn.expand("%:t")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Yank filename only" })

-- Manage windows
map("n", "<C-h>", "<C-w>h", { desc = "Move focus to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move focus to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move focus to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move focus to upper window" })
map("n", "<leader>w", "<C-W>", { desc = "[W]indows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window horizontally", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window vertically", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "[W]indow [D]rop", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-S-Left>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-S-Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase Window Width" })

-- -- Move Lines _replaced with `mini.move`_
-- map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
-- map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
-- map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
-- map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
-- map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
-- map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- Create empty lines
map("n", "<A-o>", "m`o<esc>``", { desc = "Add empty line below" })
map("n", "<A-O>", "m`O<esc>``", { desc = "Add empty line above" })

-- Copy lines
map("n", "<A-S-j>", "yyp", { desc = "Copy line down" })
map("n", "<A-S-k>", "yyP", { desc = "Copy line up" })

-- Manage buffers
-- Note: Buffer navigation (<S-h>/<S-l>) is now managed by barbar.nvim (see lua/plugins/barbar.lua)
-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Select previous buffer" })
-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Select next buffer" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Diagnostic keymaps
local go_to_diagnostic = function(next, severity)
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		vim.diagnostic.jump({ count = next and 1 or -1, severity = severity })
	end
end
map("n", "<leader>fq", vim.diagnostic.setloclist, { desc = "[F]ile [Q]uickfix list" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[C]ode line [D]iagnostics" })
map("n", "]d", go_to_diagnostic(true), { desc = "Next Diagnostic" })
map("n", "[d", go_to_diagnostic(false), { desc = "Prev Diagnostic" })
map("n", "]e", go_to_diagnostic(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", go_to_diagnostic(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", go_to_diagnostic(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", go_to_diagnostic(false, "WARN"), { desc = "Prev Warning" })

map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "[*L*]azy" })

-- Toggle format on save
map("n", "<leader>tf", function()
	vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
	if vim.g.format_on_save_enabled then
		vim.notify("Format on save enabled", vim.log.levels.INFO)
	else
		vim.notify("Format on save disabled", vim.log.levels.DEBUG)
	end
end, { desc = "[T]oggle [F]ormat on save" })
