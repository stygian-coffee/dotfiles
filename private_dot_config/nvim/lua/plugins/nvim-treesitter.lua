return {
  "nvim-treesitter/nvim-treesitter",
  -- For some reason, Treesitter sometimes fails to parse Jsonnet files if
  -- lazy loaded. Some kind of race condition I guess.
  lazy = false,
}
