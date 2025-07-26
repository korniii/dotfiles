return {
  "bngarren/checkmate.nvim",
  ft = { "markdown" }, -- Lazy loads for Markdown files matching patterns in 'files'
  opts = {
    files = {
      "*.md",
    },
    todo_markers = {
      unchecked = "[ ]",
      checked = "[x]",
    },
    metadata = {
      in_progress = {
        style = { fg = "#07f75b" },
        get_value = function()
          return "in_progress" -- Default priority
        end,
        key = "<leader>Tq",
        jump_to_on_insert = "value", -- Jump the cursor to the value so that you can edit it after insert, if you desire
      },
    },
    todo_count_formatter = function(completed, total)
      return string.format("[%.0f%%]", completed / total * 100)
    end,
    style = {
      CheckmateTodoCountIndicator = { fg = "#faef89" },
    },
  },
}
