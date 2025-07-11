-- ~/.config/nvim/lua/plugins/theme.lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Choose: "storm", "moon", "night", or "day"
      style = "storm", -- Best for full-stack work
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
      },
      sidebars = { "qf", "help", "terminal", "packer" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,

      -- Custom colors for Rails/Python optimization
      on_colors = function(colors)
        -- Enhance Ruby string colors
        colors.green1 = "#73daca"
        colors.green2 = "#41a6b5"
        -- Better Python keyword colors
        colors.magenta2 = "#ff757f"
      end,

      on_highlights = function(hl, c)
        -- Rails ERB optimization
        hl.htmlTag = { fg = c.blue }
        hl.htmlEndTag = { fg = c.blue }
        hl.htmlTagName = { fg = c.magenta, bold = true }

        -- Ruby optimization
        hl.rubySymbol = { fg = c.orange, bold = true }
        hl.rubyStringDelimiter = { fg = c.green }
        hl.rubyInterpolation = { fg = c.magenta2 }

        -- Python optimization
        hl.pythonFunction = { fg = c.blue, bold = true }
        hl.pythonBuiltin = { fg = c.cyan }
        hl.pythonDecorator = { fg = c.yellow }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
