return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint", "vale" },
      bash = { "shellcheck" },
    },
    linters = {
      markdownlint = {
        args = {
          "--disable",
          "MD013",
          "--",
        },
      },
    },
  },
}
