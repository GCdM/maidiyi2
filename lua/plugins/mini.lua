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
    end,
  }
}
