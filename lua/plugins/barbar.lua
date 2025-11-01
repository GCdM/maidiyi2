return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	keys = {
		-- Navigation
		{ "<S-h>", "<cmd>BufferPrevious<cr>", desc = "[B]uffer Previous (←)" },
		{ "<S-l>", "<cmd>BufferNext<cr>", desc = "[B]uffer Next (→)" },
		{ "<leader>bb", "<cmd>BufferPick<cr>", desc = "[B]uffer pick (interactive)" },

		--Reordering (move tabs left/right)
		{ "<A-<>", "<cmd>BufferMovePrevious<cr>", desc = "[B]uffer move left" },
		{ "<A->>", "<cmd>BufferMoveNext<cr>", desc = "[B]uffer move right" },

		{ "<leader>bp", "<cmd>BufferPin<cr>", desc = "[B]uffer [P]in/unpin" },

		{ "<leader>bd", "<cmd>BufferClose<cr>", desc = "[B]uffer [D]rop (close)" },
		{ "<leader>bD", "<cmd>BufferCloseAllButPinned<cr>", desc = "[B]uffer [*D*]rop all (except pinned)" },
		{ "<leader>bo", "<cmd>BufferCloseAllButCurrentOrPinned<cr>", desc = "[B]uffer Drop [O]thers" },
		{ "<leader>bh", "<cmd>BufferCloseBuffersLeft<cr>", desc = "[B]uffer Drop Left (←)" },
		{ "<leader>bl", "<cmd>BufferCloseBuffersRight<cr>", desc = "[B]uffer Drop Right (→)" },

		-- Sort buffers
		{
			"<leader>bsd",
			"<cmd>BufferOrderByDirectory<cr>",
			desc = "[B]uffer [S]ort by [D]irectory",
		},
		{
			"<leader>bsl",
			"<cmd>BufferOrderByLanguage<cr>",
			desc = "[B]uffer [S]ort by [L]anguage",
		},
		{
			"<leader>bsw",
			"<cmd>BufferOrderByWindowNumber<cr>",
			desc = "[B]uffer [S]ort by [W]indow number",
		},
	},
	opts = {
		animation = true,
		auto_hide = true,
		tabpages = true,
		-- Enable clickable tabs (requires mouse support)
		clickable = false,
		-- Exclude filetypes from the tabline (file tree integration)
		exclude_ft = { "snacks_explorer" },
		exclude_name = {},

		-- Icons and separators
		icons = {
			buffer_index = false, -- Show buffer index
			buffer_number = false, -- Show buffer number
			button = "", -- Close button
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
				[vim.diagnostic.severity.WARN] = { enabled = true, icon = "" },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = false },
			},
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
			filetype = {
				enabled = true,
				custom_colors = true,
			},
			separator = { left = "▎", right = "▎" },
			separator_at_end = true,
			modified = { button = "●" },
			pinned = { button = "", filename = true },
			preset = "powerline", -- Options: 'default', 'powerline', 'slanted'
			alternate = { filetype = { enabled = false } },
			current = { buffer_index = false },
			visible = { modified = { buffer_number = false } },
		},

		-- Insert buffers at the end of the list
		insert_at_end = false,
		insert_at_start = false,

		-- Maximum buffer name length
		maximum_padding = 1,
		minimum_padding = 1,
		maximum_length = 30,

		-- Semantic letters for BufferPick
		semantic_letters = true,

		-- Sidebar filetypes to offset the bufferline
		sidebar_filetypes = {
			-- Example: neo-tree on the left
			-- NvimTree = true,
			-- ["neo-tree"] = { event = "BufWipeout" },
		},

		-- Sort buffers automatically
		-- Options: 'insert_after_current', 'insert_at_end', 'insert_at_start'
		no_name_title = "[No Name]",
	},
}
