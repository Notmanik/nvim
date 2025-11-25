-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help", "terminal", "packer" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,
      on_highlights = function(hl, c)
        -- Better visibility
        hl.CursorLineNr = { fg = c.orange, bold = true }
        hl.LineNr = { fg = c.dark5 }
        hl.Comment = { fg = c.comment, italic = true }
        
        -- Better selection visibility
        hl.Visual = { bg = c.bg_visual }
        hl.Search = { bg = c.orange, fg = c.bg }
        hl.IncSearch = { bg = c.orange, fg = c.bg }
        
        -- Telescope
        hl.TelescopeNormal = { bg = c.bg_dark }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = c.bg_highlight }
        hl.TelescopePromptBorder = { bg = c.bg_highlight, fg = c.bg_highlight }
        hl.TelescopePromptTitle = { bg = c.blue, fg = c.bg }
        hl.TelescopePreviewTitle = { bg = c.green, fg = c.bg }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeSelection = { bg = c.bg_highlight, fg = c.fg, bold = true }
        
        -- NvimTree
        hl.NvimTreeNormal = { bg = c.bg_dark }
        hl.NvimTreeNormalNC = { bg = c.bg_dark }
        hl.NvimTreeRootFolder = { fg = c.blue, bold = true }
        hl.NvimTreeGitDirty = { fg = c.git.change }
        hl.NvimTreeGitNew = { fg = c.git.add }
        hl.NvimTreeGitDeleted = { fg = c.git.delete }
        hl.NvimTreeSpecialFile = { fg = c.purple, underline = true }
        hl.NvimTreeIndentMarker = { fg = c.fg_gutter }
        hl.NvimTreeImageFile = { fg = c.magenta2 }
        hl.NvimTreeSymlink = { fg = c.cyan }
        hl.NvimTreeFolderIcon = { fg = c.blue }
        
        -- Diagnostics
        hl.DiagnosticError = { fg = c.error }
        hl.DiagnosticWarn = { fg = c.warning }
        hl.DiagnosticInfo = { fg = c.info }
        hl.DiagnosticHint = { fg = c.hint }
        
        -- LSP
        hl.LspReferenceText = { bg = c.fg_gutter }
        hl.LspReferenceRead = { bg = c.fg_gutter }
        hl.LspReferenceWrite = { bg = c.fg_gutter }
        
        -- Completion
        hl.CmpItemAbbrDeprecated = { fg = c.fg_gutter, strikethrough = true }
        hl.CmpItemAbbrMatch = { fg = c.blue, bold = true }
        hl.CmpItemAbbrMatchFuzzy = { fg = c.blue, bold = true }
        hl.CmpItemKindVariable = { fg = c.cyan }
        hl.CmpItemKindInterface = { fg = c.cyan }
        hl.CmpItemKindText = { fg = c.fg }
        hl.CmpItemKindFunction = { fg = c.magenta }
        hl.CmpItemKindMethod = { fg = c.magenta }
        hl.CmpItemKindKeyword = { fg = c.orange }
        hl.CmpItemKindProperty = { fg = c.green1 }
        hl.CmpItemKindUnit = { fg = c.orange }
        
        -- Git signs
        hl.GitSignsAdd = { fg = c.git.add }
        hl.GitSignsChange = { fg = c.git.change }
        hl.GitSignsDelete = { fg = c.git.delete }
        
        -- Indent blankline
        hl.IndentBlanklineChar = { fg = c.fg_gutter, nocombine = true }
        hl.IndentBlanklineContextChar = { fg = c.purple, nocombine = true }
        
        -- Which-key
        hl.WhichKey = { fg = c.cyan }
        hl.WhichKeyGroup = { fg = c.blue }
        hl.WhichKeyDesc = { fg = c.magenta }
        hl.WhichKeySeperator = { fg = c.comment }
        hl.WhichKeySeparator = { fg = c.comment }
        hl.WhichKeyFloat = { bg = c.bg_dark }
        hl.WhichKeyValue = { fg = c.dark5 }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
