return {
  "kevinhwang91/nvim-bqf",
  dependencies = {
    "junegunn/fzf",
  },
  ft = "qf",
  auto_enable = true,
  opts = {
    auto_resize_height = true,
    preview = {
      win_height = 20,
      win_vheight = 20,
      border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
      show_title = false,
      should_preview_cb = function(bufnr, qwinid)
        local ret = true
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local fsize = vim.fn.getfsize(bufname)
        if fsize > 100 * 1024 then
          -- skip file size greater than 100k
          ret = false
        end
        return ret
      end,
    },
  },
}
