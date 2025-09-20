return {
  -- Git signs in the gutter and hunk management
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with :Gitsigns toggle_current_line_blame
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    },
    keys = {
      -- Navigation
      { ']h', ':Gitsigns next_hunk<CR>', desc = 'Next git hunk' },
      { '[h', ':Gitsigns prev_hunk<CR>', desc = 'Previous git hunk' },

      -- Actions
      { '<leader>hs', ':Gitsigns stage_hunk<CR>', desc = '[H]unk [S]tage' },
      { '<leader>hr', ':Gitsigns reset_hunk<CR>', desc = '[H]unk [R]eset' },
      { '<leader>hS', ':Gitsigns stage_buffer<CR>', desc = '[H]unk [S]tage Buffer' },
      { '<leader>hu', ':Gitsigns undo_stage_hunk<CR>', desc = '[H]unk [U]ndo Stage' },
      { '<leader>hR', ':Gitsigns reset_buffer<CR>', desc = '[H]unk [R]eset Buffer' },
      { '<leader>hp', ':Gitsigns preview_hunk<CR>', desc = '[H]unk [P]review' },
      { '<leader>hb', function() require('gitsigns').blame_line{full=true} end, desc = '[H]unk [B]lame Line' },
      { '<leader>hd', ':Gitsigns diffthis<CR>', desc = '[H]unk [D]iff This' },
      { '<leader>hD', function() require('gitsigns').diffthis('~') end, desc = '[H]unk [D]iff This ~' },

      -- Toggles
      { '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>', desc = '[T]oggle Git [B]lame' },
      { '<leader>td', ':Gitsigns toggle_deleted<CR>', desc = '[T]oggle [D]eleted Lines' },

      -- Text object
      { 'ih', ':<C-U>Gitsigns select_hunk<CR>', mode = { 'o', 'x' }, desc = 'Git Hunk' },
    },
  },

  -- Advanced git diff viewing and merge conflict resolution
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh' },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = 'diff2_horizontal',
          disable_diagnostics = true,
        },
        merge_tool = {
          layout = 'diff3_horizontal',
          disable_diagnostics = true,
        },
      },
      file_panel = {
        listing_style = 'tree',
        tree_options = {
          flatten_dirs = true,
          folder_statuses = 'only_folded',
        },
      },
      keymaps = {
        view = {
          { 'n', '<tab>', require('diffview.actions').select_next_entry, { desc = 'Open the diff for the next file' } },
          { 'n', '<s-tab>', require('diffview.actions').select_prev_entry, { desc = 'Open the diff for the previous file' } },
          { 'n', 'gf', require('diffview.actions').goto_file, { desc = 'Open the file in a new split' } },
          { 'n', '<C-w><C-f>', require('diffview.actions').goto_file_split, { desc = 'Open the file in a new split' } },
          { 'n', '<C-w>gf', require('diffview.actions').goto_file_tab, { desc = 'Open the file in a new tabpage' } },
          { 'n', '<leader>e', require('diffview.actions').focus_files, { desc = 'Bring focus to the file panel' } },
          { 'n', '<leader>b', require('diffview.actions').toggle_files, { desc = 'Toggle the file panel.' } },
        },
      },
    },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [D]iff View' },
      { '<leader>gD', '<cmd>DiffviewOpen HEAD~1<cr>', desc = '[G]it [D]iff View HEAD~1' },
      { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it File [H]istory' },
      { '<leader>gH', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it Current File [H]istory' },
      { '<leader>gm', '<cmd>DiffviewOpen origin/main...HEAD<cr>', desc = '[G]it [M]erge Diff' },
      { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = '[G]it Diff [C]lose' },
    },
  },
}