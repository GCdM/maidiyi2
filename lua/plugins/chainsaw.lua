return {
	"chrisgrieser/nvim-chainsaw",
	init = function()
		-- Nvim 0.12 doesn't honor chainsaw's `invalidate = true`: a gutter sign
		-- survives when its line is deleted manually (e.g. `dd`) and re-anchors to
		-- the next line.
		-- A sign can only be orphaned by a LINE DELETION, so we gate the scan
		-- behind a line-count check: for insertions/typing the callback is just
		-- two O(1) lookups and returns; only a deletion pays for the (small)
		-- scan over the existing signs.
		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
			desc = "Reconcile chainsaw gutter signs after manual edits",
			callback = function()
				local ns = vim.api.nvim_get_namespaces()["chainsaw.markers"]
				if not ns then
					return
				end
				local lines = vim.fn.line("$")
				local prev = vim.b.chainsaw_lines
				if prev == nil then
					vim.b.chainsaw_lines = lines -- prime on first change; nothing to prune
					return
				end
				vim.b.chainsaw_lines = lines
				-- nothing can be orphaned unless a line was removed
				if lines >= prev then
					return
				end
				local ok, marker = pcall(function()
					return require("chainsaw.config.config").config.marker
				end)
				if not ok or not marker then
					return
				end
				local signs = vim.api.nvim_buf_get_extmarks(0, ns, 0, -1, {})
				for _, m in ipairs(signs) do
					local row = m[2]
					local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1] or ""
					if not line:find(marker, 1, true) then
						vim.api.nvim_buf_del_extmark(0, ns, m[1])
					end
				end
			end,
		})
	end,
	event = "VeryLazy",	keys = {
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
				-- nvim-chainsaw's `invalidate = true` sign extmarks survive line
				-- deletion on Nvim 0.12 (they re-anchor to the next line), leaving
				-- stale gutter icons. Clear the whole markers namespace instead.
				local ns = vim.api.nvim_get_namespaces()["chainsaw.markers"]
				if ns then
					vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
				end
			end,
			desc = "[L]og [D]elete (all)",
		},
	},
	opts = {
		marker = "🪚",
		visuals = { icon = "󰹈" },
	},
}
