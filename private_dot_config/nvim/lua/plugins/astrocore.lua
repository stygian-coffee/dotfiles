return {
  "AstroNvim/astrocore",
  opts = {
    options = {
      opt = {
        breakindent = true,
        breakindentopt = "shift:3",
        clipboard = "",
        grepprg = "rg --vimgrep",
        laststatus = 2,
        scrolloff = 8,
        wrap = true,
      },
    },
    mappings = {
      n = {
        ["<Leader>e"] = {
          function()
            vim.cmd(
              "Neotree toggle position=current dir="
              .. vim.fs.dirname(vim.api.nvim_buf_get_name(0))
            )
          end,
          desc = "toggle explorer",
        },
        ["<Leader>\\"] = {
          function()
            return
                vim.cmd(
                  "split | Neotree toggle position=current dir="
                  .. vim.fs.dirname(vim.api.nvim_buf_get_name(0))
                )
          end,
          desc = "open explorer in horizontal split",
        },
        ["<Leader>|"] = {
          function()
            return
                vim.cmd(
                  "vsplit | Neotree toggle position=current dir="
                  .. vim.fs.dirname(vim.api.nvim_buf_get_name(0))
                )
          end,
          desc = "open explorer in vertical split",
        },
        ["gj"] = { "10j", desc = "navigate down 10 lines" },
        ["gk"] = { "10k", desc = "navigate up 10 lines" },
      },
      v = {
        ["gj"] = { "10j", desc = "navigate down 10 lines" },
        ["gk"] = { "10k", desc = "navigate up 10 lines" },
      },
    },
  }
}
