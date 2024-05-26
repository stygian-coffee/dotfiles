local get_hlgroup = require("astroui").get_hlgroup
local ErrorMsg = get_hlgroup("ErrorMsg")
local ModeMsg = get_hlgroup("ModeMsg")
local Normal = get_hlgroup("Normal")
local TabLine = get_hlgroup("TabLine")

return {
  "AstroNvim/astroui",
  opts = {
    colorscheme = "base16-seti",
    highlights = {
      init = function()
        local LineNr = get_hlgroup("LineNr")

        return {
          VertSplit = { link = "LineNr" },

          -- Fix diagnostics next to the line numbers having the wrong background color.
          DiagnosticError = { fg = "Red", bg = LineNr.bg },
          DiagnosticWarn = { fg = "Orange", bg = LineNr.bg },
          DiagnosticInfo = { fg = "LightBlue", bg = LineNr.bg },
          DiagnosticHint = { fg = "LightGrey", bg = LineNr.bg },
          DiagnosticOk = { fg = "LightGreen", bg = LineNr.bg },
        }
      end,
    },
    status = {
      colors = {
        close_fg = ErrorMsg.fg,
        fg = Normal.fg,
        bg = TabLine.bg,
        section_fg = Normal.fg,
        section_bg = TabLine.bg,
        buffer_active_close_fg = ErrorMsg.fg,
        buffer_visible_close_fg = ErrorMsg.fg,
        buffer_picker_fg = ModeMsg.fg,
        tab_close_fg = ErrorMsg.fg,
      }
    }
  }
}
