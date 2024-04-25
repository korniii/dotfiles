return {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/korniii/**.md" },
  keys = {
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "[O]bsidian [S]earch" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "[O]bsidian [F]ind File" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "[O]bsidian [O]pen" },
    { "<leader>ob", "<Cmd>ObsidianBacklinks<CR>", desc = "[O]bsidian [B]acklinks" },
    { "<leader>od", "<Cmd>ObsidianToday<CR>", desc = "[O]bsidian [T]odays Note" },
    { "<leader>on", ":ObsidianNew ", desc = "[O]bsidian [N]ew Note" },
    { "<leader>oy", "<Cmd>ObsidianYesterday<CR>", desc = "[O]bsidian [Y]esterdays Note" },
    {
      "gf",
      function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end,
      noremap = false,
      expr = true,
    },
  },
  opts = {
    dir = "~/notes/",
    notes_subdir = "inbox",
    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      new_notes_location = "current_dir",
      prepend_note_id = true,
    },
    open_app_foreground = true,
    finder = "telescope.nvim",
  },
}
