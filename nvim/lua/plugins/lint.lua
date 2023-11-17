return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      bash = { "shellcheck" },
      markdown = { "markdownlint", "vale" },
      terraform = { "tflint", "tfsec" },
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
