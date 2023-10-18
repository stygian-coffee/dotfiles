return {
  colorscheme = "base16-seti",

  plugins = {
    {
      "chriskempson/base16-vim",
      lazy = false,
    },
    {
      "ggandor/leap.nvim",
      event = "BufEnter",
      config = function()
        require("leap").add_default_mappings()
      end,
    },
    {
      "matze/vim-move",
      event = "BufEnter",
    },
    {
      "rebelot/heirline.nvim",
      config = function(plugin, opts)
        require("plugins.configs.heirline")(plugin, opts)

        local function my_colors()
          local get_hlgroup = require("astronvim.utils").get_hlgroup
          local ErrorMsg = get_hlgroup("ErrorMsg")
          local ModeMsg = get_hlgroup("ModeMsg")
          local Normal = get_hlgroup("Normal")
          local TabLine = get_hlgroup("TabLine")

          local colors = {
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

          for _, section in ipairs {
            "git_branch",
            "file_info",
            "git_diff",
            "diagnostics",
            "lsp",
            "macro_recording",
            "mode",
            "cmd_info",
            "treesitter",
            "nav",
          } do
            colors[section .. "_bg"] = colors["section_bg"]
            colors[section .. "_fg"] = colors["section_fg"]
          end

          return colors
        end

        local heirline = require "heirline"
        heirline.load_colors(my_colors())
      end,
    },
    {
      "tpope/vim-repeat",
      event = "BufEnter",
    },
    {
      "tpope/vim-surround",
      event = "BufEnter",
    },
    {
      "tpope/vim-unimpaired",
      event = "BufEnter",
    },
  },

  highlights = {
    init = function()
      local get_hlgroup = require("astronvim.utils").get_hlgroup
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

  mappings = {
    n = {
      ["<leader>e"] = { "<cmd>Neotree toggle position=current<cr>", desc = "Toggle Explorer" },
      ["<leader>\\"] = {
        "<cmd>split | Neotree toggle position=current<cr>",
        desc = "Open Explorer in horizontal split",
      },
      ["<leader>|"] = {
        "<cmd>vsplit | Neotree toggle position=current<cr>",
        desc = "Open Explorer in vertical split",
      },
      ["gj"] = { "10j", desc = "Navigate down 10 lines" },
      ["gk"] = { "10k", desc = "Navigate up 10 lines" },
    },
    v = {
      ["gj"] = { "10j", desc = "Navigate down 10 lines" },
      ["gk"] = { "10k", desc = "Navigate up 10 lines" },
    },
  },

  options = {
    opt = {
      grepprg = "rg --vimgrep",
      laststatus = 2,
      scrolloff = 8,
    },
  },
}
