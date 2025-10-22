return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup({
        n_lines = 500,
        custom_textobjects = {
          [','] = false, -- Disable comma as a textobject
        }
      })


      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy autopairs
      require('mini.pairs').setup()

      -- Move to next/previous textobjects with square brackets
      --
      -- Examples:
      --  - ]f / [f - go to next/prev file
      --  - ]c / [c - go to next/prev comment
      --  - ]d / [d - go to next/prev diagnostic (already defined in keymaps.lua)
      require('mini.bracketed').setup()

      -- Icons for files, directories, and other elements
      require('mini.icons').setup()

      require('mini.move').setup()

      -- Define custom highlight groups for Grapple
      vim.api.nvim_set_hl(0, 'GrappleStatuslineActive', { link = 'Special' })
      vim.api.nvim_set_hl(0, 'GrappleStatuslineInactive', { link = 'Comment' })

      local statusline = require('mini.statusline')
      statusline.setup({
        content = {
          active = function()
            local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
            local git = statusline.section_git({ trunc_width = 40 })
            local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
            local filename = statusline.section_filename({ trunc_width = 140 })
            local search = statusline.section_searchcount({ trunc_width = 75 })

            -- Only show filetype
            local filetype = vim.bo.filetype ~= '' and vim.bo.filetype or ''

            -- Grapple statusline component
            local grapple = ''
            local grapple_hl = 'GrappleStatuslineInactive'
            local is_grappled = false

            if package.loaded["grapple"] then
              local ok, exists = pcall(require("grapple").exists)
              if ok then
                is_grappled = exists
              end

              local ok2, result = pcall(require("grapple").statusline)
              if ok2 and result and result ~= '' then
                grapple = result
              end
            end

            -- Highlight grapple differently when current buffer is tagged
            if is_grappled then
              grapple_hl = 'GrappleStatuslineActive'
            end

            return statusline.combine_groups({
              { hl = grapple_hl,               strings = { grapple } },
              { hl = mode_hl,                  strings = { search, diagnostics } },
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%<', -- Mark general truncate point
              '%=', -- Separator between left and right aligned items
              { hl = 'MiniStatuslineFileinfo', strings = { filetype } },
              { hl = mode_hl,                  strings = { mode } },
              { hl = 'MiniStatuslineDevinfo',  strings = { git } },
            })
          end,
        },
        set_vim_settings = false,
      })

      -- Refresh statusline when Grapple updates
      vim.api.nvim_create_autocmd("User", {
        pattern = "GrappleUpdate",
        callback = function()
          vim.cmd.redrawstatus()
        end,
      })
    end,
  }
}
