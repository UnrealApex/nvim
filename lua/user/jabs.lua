require('jabs').setup({
  -- Options for the main window
  position = 'center', -- center, corner. Default corner
  width = 80, -- default 50
  height = 20, -- default 10
  border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

  offset = { -- window position offset
      top = 2, -- default 0
      bottom = 2, -- default 0
      left = 2, -- default 0
      right = 2, -- default 0
  },

  -- Options for preview window
  preview_position = 'top', -- top, bottom, left, right. Default top
  preview = {
      width = 70, -- default 70
      height = 30, -- default 30
      border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
  },

  -- Default highlights (must be a valid :highlight)
  highlight = {
      current = "Title", -- default StatusLine
        hidden = "", -- default ModeMsg
        split = "", -- default StatusLine
        alternate = "" -- default WarningMsg
  },


  -- Keymaps
  keymap = {
      close = "d", -- Close buffer. Default D
      jump = "<cr>", -- Jump to buffer. Default <cr>
      h_split = "h", -- Horizontally split buffer. Default s
      v_split = "v", -- Vertically split buffer. Default v
      preview = "p", -- Open buffer preview. Default P
  },
})
