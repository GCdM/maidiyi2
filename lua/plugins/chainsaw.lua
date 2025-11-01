return {
	"chrisgrieser/nvim-chainsaw",
	event = "VeryLazy",
	keys = {
		{
			"<leader>lv",
			function()
				require("chainsaw").variableLog()
			end,
			desc = "[L]og [V]ariable",
			mode = { "n", "v" },
		},
		{
			"<leader>lo",
			function()
				require("chainsaw").objectLog()
			end,
			desc = "[L]og [O]bject",
			mode = { "n", "v" },
		},
		{
			"<leader>lm",
			function()
				require("chainsaw").messageLog()
			end,
			desc = "[L]og [M]essage",
		},
		{
			"<leader>lt",
			function()
				require("chainsaw").timeLog()
			end,
			desc = "[L]og [T]ime",
		},
		{
			"<leader>ld",
			function()
				require("chainsaw").removeLogs()
			end,
			desc = "[L]og [D]elete (all)",
		},
	},
	opts = {
		marker = "󰹈",
	},
}
