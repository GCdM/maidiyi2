return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 999,
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
	},
	{ "folke/tokyonight.nvim" },
	{ "thesimonho/kanagawa-paper.nvim" },
}
