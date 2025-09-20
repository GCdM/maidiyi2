return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },

    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },

    notifier = {
      enabled = true,
      timeout = 3000,
    },

    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              position = "right",
              width = 0.5,
            },
          },
        },
      },
    },

    -- quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    -- words = { enabled = true },

    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    },
    terminal = {}
  },
  keys = {
    -- -- Top Pickers & Explorer
    { "\\",         function() Snacks.explorer() end,                     desc = "File Explorer" },
    { "<leader>/",  function() Snacks.picker.grep() end,                  desc = "Project Grep" },
    { "<leader>sf", function() Snacks.picker.smart() end,                 desc = "[S]earch [F]iles" },
    { "<leader>sb", function() Snacks.picker.buffers() end,               desc = "[S]earch [B]uffers" },
    { "<leader>ns", function() Snacks.picker.notifications() end,         desc = "[N]otification [S]earch" },
    -- { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },

    -- -- find
    -- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    -- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "[F]ind Git Files" },
    -- { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    -- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

    -- -- git
    { "<leader>gg", function() Snacks.lazygit() end,                      desc = "Lazygit" },
    { "<leader>gB", function() Snacks.gitbrowse() end,                    desc = "[G]it [B]rowse",                    mode = { "n", "v" } },
    -- { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    -- { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    -- { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    -- { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    -- { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    -- { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },

    -- -- Grep
    -- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    -- { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    -- { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

    -- -- search
    { "<leader>sb", function() Snacks.picker.lines() end,                 desc = "[S]earch [B]uffer" },
    { "<leader>sc", function() Snacks.picker.commands() end,              desc = "[S]earch [C]ommands" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,           desc = "[S]earch [D]iagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,    desc = "[S]earch Buffer [*D*]iagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end,                  desc = "[S]earch [H]elp" },
    { "<leader>si", function() Snacks.picker.icons() end,                 desc = "[S]earch [I]cons" },
    { "<leader>sj", function() Snacks.picker.jumps() end,                 desc = "[S]earch [J]umps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,               desc = "[S]earch [K]eymaps" },
    { "<leader>sp", function() Snacks.picker.lazy() end,                  desc = "[S]earch [P]lugins" },
    { "<leader>sq", function() Snacks.picker.qflist() end,                desc = "[S]earch [Q]uickfix" },
    { "<leader>sr", function() Snacks.picker.resume() end,                desc = "[S]earch [R]esume" },

    -- { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    -- { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    -- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    -- { "<leader>sC", function() Snacks.picker.command_history() end, desc = "Command History" },
    -- { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    -- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    -- { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    -- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>su", function() Snacks.picker.undo() end,                  desc = "Undo History" },
    { "<leader>uc", function() Snacks.picker.colorschemes() end,          desc = "[U]I [C]olorschemes" },

    -- -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "[G]oto Definition" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "[G]oto Declaration" },
    { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                              desc = "[G]oto [R]eferences" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "[G]oto [I]mplementation" },
    { "gt",         function() Snacks.picker.lsp_type_definitions() end,  desc = "[G]oto [T]ype Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "[S]earch LSP [S]ymbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "[S]earch LSP Workspace [*S*]ymbols" },

    --- -- Buffer
    { "<leader>bs", function() Snacks.scratch() end,                      desc = "[B]uffer [S]cratch" },
    { "<leader>bd", function() Snacks.bufdelete() end,                    desc = "[B]uffer [D]rop" },

    -- -- Other
    { "<leader>nh", function() Snacks.notifier.show_history() end,        desc = "[N]otification [H]istory" },
    { "<leader>nD", function() Snacks.notifier.hide() end,                desc = "[N]otifications [D]ismiss All" },
    { "<leader>fR", function() Snacks.rename.rename_file() end,           desc = "[F]ile [R]ename" },
    {
      "<c-/>",
      function()
        Snacks.terminal(nil, {
          win = {
            position = "right",
            width = 0.5,
            wo = {
              winbar = "",
              statusline = "",
            },
          }
        })
      end,
      desc = "Toggle Terminal",
      mode = { "n", "t" }
    },

    { "]]", function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    -- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    -- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
  },
  -- init = function()
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "VeryLazy",
  --     callback = function()
  --       -- Setup some globals for debugging (lazy-loaded)
  --       _G.dd = function(...)
  --         Snacks.debug.inspect(...)
  --       end
  --       _G.bt = function()
  --         Snacks.debug.backtrace()
  --       end
  --       vim.print = _G.dd -- Override print to use snacks for `:=` command
  --
  --       -- Create some toggle mappings
  --       Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
  --       Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
  --       Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
  --       Snacks.toggle.diagnostics():map("<leader>ud")
  --       Snacks.toggle.line_number():map("<leader>ul")
  --       Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
  --       Snacks.toggle.treesitter():map("<leader>uT")
  --       Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
  --       Snacks.toggle.inlay_hints():map("<leader>uh")
  --       Snacks.toggle.indent():map("<leader>ug")
  --       Snacks.toggle.dim():map("<leader>uD")
  --     end,
  --   })
  -- end,
}
