return {
	-- Git signs in the gutter and hunk management
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			attach_to_untracked = true,
			signs_staged_enable = true,
			preview_config = { border = "single" },
		},
		keys = {
			-- Navigation
			{ "]h", ":Gitsigns next_hunk<CR>", desc = "Next git hunk" },
			{ "[h", ":Gitsigns prev_hunk<CR>", desc = "Previous git hunk" },

			-- Actions
			{ "<leader>hs", ":Gitsigns stage_hunk<CR>", desc = "[H]unk [S]tage" },
			{ "<leader>hr", ":Gitsigns reset_hunk<CR>", desc = "[H]unk [R]eset" },
			{
				"<leader>hS",
				":Gitsigns stage_buffer<CR>",
				desc = "[H]unk [S]tage Buffer",
			},
			{
				"<leader>hu",
				":Gitsigns undo_stage_hunk<CR>",
				desc = "[H]unk [U]ndo Stage",
			},
			{ "<leader>hp", ":Gitsigns preview_hunk<CR>", desc = "[H]unk [P]review" },
			{
				"<leader>hb",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				desc = "[H]unk [B]lame Line",
			},
			-- { '<leader>hR', ':Gitsigns reset_buffer<CR>',                                  desc = '[H]unk [R]eset Buffer' },
			-- { '<leader>hd', ':Gitsigns diffthis<CR>',                                      desc = '[H]unk [D]iff This' },
			-- { '<leader>hD', function() require('gitsigns').diffthis('~') end,              desc = '[H]unk [D]iff This ~' },

			-- Toggles
			{
				"<leader>tb",
				":Gitsigns toggle_current_line_blame<CR>",
				desc = "[T]oggle Git [B]lame",
			},
			{
				"<leader>td",
				":Gitsigns toggle_deleted<CR>",
				desc = "[T]oggle [D]eleted Lines",
			},

			-- Text object
			{
				"ih",
				":<C-U>Gitsigns select_hunk<CR>",
				desc = "Git Hunk",
				mode = { "o", "x" },
			},
		},
	},

	-- Advanced git diff viewing and merge conflict resolution
	-- Mapped under `<leader>H` because it requires "closing"
	-- {
	--   'sindrets/diffview.nvim',
	--   cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh' },
	--   opts = {
	--     enhanced_diff_hl = true,
	--     view = {
	--       default = {
	--         layout = 'diff2_horizontal',
	--         disable_diagnostics = true,
	--       },
	--       merge_tool = {
	--         layout = 'diff3_horizontal',
	--         disable_diagnostics = true,
	--       },
	--     },
	--     file_panel = {
	--       listing_style = 'tree',
	--       tree_options = {
	--         flatten_dirs = true,
	--         folder_statuses = 'only_folded',
	--       },
	--     },
	--     keymaps = {
	--       view = {
	--         { 'n', '<tab>',      function() require('diffview.actions').select_next_entry() end, { desc = 'Open the diff for the next file' } },
	--         { 'n', '<s-tab>',    function() require('diffview.actions').select_prev_entry() end, { desc = 'Open the diff for the previous file' } },
	--         { 'n', 'gf',         function() require('diffview.actions').goto_file() end,         { desc = 'Open the file in a new split' } },
	--         { 'n', '<C-w><C-f>', function() require('diffview.actions').goto_file_split() end,   { desc = 'Open the file in a new split' } },
	--         { 'n', '<C-w>gf',    function() require('diffview.actions').goto_file_tab() end,     { desc = 'Open the file in a new tabpage' } },
	--         { 'n', '<leader>e',  function() require('diffview.actions').focus_files() end,       { desc = 'Bring focus to the file panel' } },
	--         { 'n', '<leader>b',  function() require('diffview.actions').toggle_files() end,      { desc = 'Toggle the file panel.' } },
	--       },
	--     },
	--   },
	--   keys = {
	--     { '<leader>gd', '<cmd>DiffviewOpen<cr>',                    desc = '[G]it [D]iff View' },
	--     { '<leader>gD', '<cmd>DiffviewOpen HEAD~1<cr>',             desc = '[G]it [D]iff View HEAD~1' },
	--     { '<leader>gh', '<cmd>DiffviewFileHistory<cr>',             desc = '[G]it File [H]istory' },
	--     { '<leader>gH', '<cmd>DiffviewFileHistory %<cr>',           desc = '[G]it Current File [H]istory' },
	--     { '<leader>gm', '<cmd>DiffviewOpen origin/main...HEAD<cr>', desc = '[G]it [M]erge Diff' },
	--     { '<leader>gc', '<cmd>DiffviewClose<cr>',                   desc = '[G]it Diff [C]lose' },
	--   },
	-- },
}
