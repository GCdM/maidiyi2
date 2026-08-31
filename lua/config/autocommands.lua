-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Global toggle for format on save
vim.g.format_on_save_enabled = true

-- Wrap long lines for plain text files without inserting EOL characters
vim.api.nvim_create_autocmd("FileType", {
	desc = "Wrap lines in text files",
	group = vim.api.nvim_create_augroup("text-file-wrap", { clear = true }),
	pattern = { "text", "txt" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.textwidth = 0
		vim.opt_local.wrapmargin = 0
		vim.opt_local.formatoptions:remove("t")
	end,
})

-- -- Format on save for specific filetypes
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	desc = "Format on save for specific filetypes",
-- 	group = vim.api.nvim_create_augroup("format-on-save", { clear = true }),
-- 	callback = function()
-- 		-- Check if format on save is enabled
-- 		if vim.g.format_on_save_enabled then
-- 			vim.lsp.buf.format({ async = false })
-- 		end
-- 	end,
-- })

-- Auto-resize windows on terminal resize
vim.api.nvim_create_autocmd("VimResized", {
	desc = "Auto-resize windows when terminal is resized",
	group = vim.api.nvim_create_augroup("auto-resize-windows", { clear = true }),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Relocate :help buffers into a right-side floating window
vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Open :help in a right-side floating window",
	group = vim.api.nvim_create_augroup("floating-help", { clear = true }),
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "help" then
			return
		end
		local win = vim.api.nvim_get_current_win()
		if vim.api.nvim_win_get_config(win).relative ~= "" then
			return
		end
		local width = math.floor(vim.o.columns * 0.4)
		local height = vim.o.lines - vim.o.cmdheight - 2
		vim.api.nvim_open_win(args.buf, true, {
			relative = "editor",
			width = width,
			height = height,
			col = vim.o.columns - width,
			row = 0,
			style = "minimal",
			border = "rounded",
		})
		if #vim.api.nvim_list_wins() > 1 then
			pcall(vim.api.nvim_win_close, win, false)
		end
	end,
})

-- Warn on startup if expected external binaries are missing
vim.api.nvim_create_autocmd("VimEnter", {
	desc = "Check for required external binaries",
	group = vim.api.nvim_create_augroup("binary-check", { clear = true }),
	callback = function()
		local required = { "rg", "fd", "git", "lazygit", "biome", "dprint" }
		local missing = {}
		for _, bin in ipairs(required) do
			if vim.fn.executable(bin) == 0 then
				table.insert(missing, bin)
			end
		end
		if #missing > 0 then
			vim.notify("Missing binaries: " .. table.concat(missing, ", "), vim.log.levels.WARN)
		end
	end,
})

-- Validate plugin configurations on startup (after plugins finish loading)
vim.api.nvim_create_autocmd("User", {
	desc = "Validate plugin installations and loadability",
	group = vim.api.nvim_create_augroup("plugin-validation", { clear = true }),
	pattern = "VeryLazy",
	callback = function()
		local issues = {}

		-- 1. Every enabled plugin spec must be installed
		for _, plugin in ipairs(require("lazy").plugins()) do
			if plugin.enabled ~= false and plugin.installed == false then
				table.insert(issues, "plugin not installed: " .. plugin.name)
			end
		end

		-- 2. The modules our configuration depends on must be loadable
		local required_modules = {
			"chainsaw",
			"todo-comments",
			"colorizer",
			"bufferline", -- barbar.nvim
			"gitsigns",
			"snacks",
			"grapple",
			"persistence",
			"which-key",
			"blink.cmp",
			"nvim-treesitter",
			"mini.ai",
			"mini.surround",
			"mini.pairs",
			"mini.bracketed",
			"mini.move",
			"mini.jump",
			"mini.icons",
			"mini.statusline",
		}
		for _, mod in ipairs(required_modules) do
			local ok, err = pcall(require, mod)
			if not ok then
				local brief = tostring(err):gsub("\n.*", "")
				table.insert(issues, ("module failed to load: %s (%s)"):format(mod, brief))
			end
		end

		if #issues > 0 then
			vim.notify(
				"Plugin validation issues:\n- " .. table.concat(issues, "\n- "),
				vim.log.levels.WARN
			)
		end
	end,
})
