return {
  "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  submodules = false,
  opts = {
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterBlue",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
  },
  main = "rainbow-delimiters.setup", -- Required. Defaults to the repository name if not set.
}
