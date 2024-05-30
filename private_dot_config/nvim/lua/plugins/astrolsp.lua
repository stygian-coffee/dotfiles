return {
  "AstroNvim/astrolsp",
  opts = {
    config = {
      jsonnet_ls = {
        cmd = {
          "jsonnet-language-server",
          "--lint",
        },
      },
    },
  },
}
