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
      vale = {
        -- `condition` is another LazyVim extension that allows you to
        -- dynamically enable/disable linters based on the context -> if .vale.ini is present
        condition = function(ctx)
          return vim.fs.find({ ".vale.ini" }, { path = ctx.filename, upward = true })[1]
        end,
      },
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
