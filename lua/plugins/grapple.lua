return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		scope = "git",
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>m", "<cmd>Grapple toggle<cr>", desc = "[M]ark Buffer (Grapple)" },
		{ "<A-m>", "<cmd>Grapple toggle_tags<cr>", desc = "Open Grapple [M]arked" },
		{ "<A-]>", "<cmd>Grapple cycle_tags next<cr>", desc = "Next Grappled Mark" },
		{ "<A-[>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Prev Grappled Mark" },
	},
}
