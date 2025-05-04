return {

  { "PaterJason/nvim-treesitter-sexp", enabled = false },
  {
    "julienvincent/nvim-paredit",
    ft = "clojure",
    config = function()
      require("nvim-paredit").setup()
    end,
  },
  { "gpanders/nvim-parinfer", ft = "clojure" },
}
