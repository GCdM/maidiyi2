return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()
		ts.install({
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"css",
			"yaml",
		})
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("nvim-treesitter-start", {}),
			callback = function()
				if not pcall(vim.treesitter.start) or vim.bo.filetype == "ruby" then
					return
				end
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- Fold with treesitter (from main: "Enable treesitter folds")
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldenable = false -- Don't fold by default when opening files
		vim.opt.foldlevel = 99 -- High value to open most folds by default
	end,
}