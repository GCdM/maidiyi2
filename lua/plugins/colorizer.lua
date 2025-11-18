return {
	"norcalli/nvim-colorizer.lua",
	event = "VeryLazy",
	keys = {
		{
			"<leader>uC",
			"<cmd>ColorizerToggle<cr>",
			desc = "[U]I [C]olourise",
		},
	},
	opts = {
		"*", -- Highlight all files, but customize for specific file types
		css = { css = true }, -- Enable parsing rgb(...) syntax in css files
		javascript = { names = false }, -- Disable parsing "names" like Blue in JavaScript files
		typescript = { names = false },
		javascriptreact = { names = false },
		typescriptreact = { names = false },
	},
}
