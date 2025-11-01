return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	init = function()
		-- Set sessionoptions to include globals for barbar.nvim integration
		vim.opt.sessionoptions:append("globals")

		-- Listen to PersistenceSavePre and trigger SessionSavePre for barbar.nvim
		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistenceSavePre",
			callback = function()
				-- Trigger SessionSavePre event for barbar.nvim to save buffer state
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
			end,
		})

		-- Auto-load session on startup
		vim.schedule(function()
			require("persistence").load()
		end)
	end,
	opts = {
		dir = vim.fn.stdpath("state") .. "/sessions/", -- Session directory
		need = 2, -- Minimum number of file buffers that need to be open to save
		branch = true, -- Use git branch in session name
	},
	keys = {
		{
			"<leader>qs",
			function()
				require("persistence").load()
			end,
			desc = "[Q]uit [S]ession Load Current Dir",
		},
		{
			"<leader>qS",
			function()
				require("persistence").select()
			end,
			desc = "[Q]uit [S]ession Select",
		},
		{
			"<leader>ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "[Q]uit Session [L]oad Last",
		},
		{
			"<leader>qd",
			function()
				require("persistence").stop()
			end,
			desc = "[Q]uit Session [D]on't Save",
		},
	},
}
