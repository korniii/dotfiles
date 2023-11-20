return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, { "encoding" })
    opts.sections.lualine_z = { "filetype" }
  end,
}
