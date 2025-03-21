return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "" },
        changedelete = { text = "_" },
        untracked = { text = "?" },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = {
      {
        "<leader>gdd",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
        desc = "[G]it [D]iffView [Diff]",
      },
      {
        "<leader>gdh",
        function()
          vim.ui.input({ prompt = "Git Pickaxe (empty = full history)" }, function(query)
            if not query then
              return
            end
            if query ~= "" then
              query = string.format(" -G'%s'", query)
            end
            vim.cmd("DiffviewFileHistory %" .. query)
            vim.cmd.wincmd("w") -- go directly to file window
            vim.cmd.wincmd("|") -- maximize
          end)
        end,
        desc = "[G]it [D]iffView File [H]istory",
      },
      { "<leader>gdm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "[G]it [D]iffView origin/[m]ain" },
    },
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup()

      vim.api.nvim_set_keymap(
        "n",
        "<leader>go",
        '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        { silent = true, desc = "[G]it [O]pen in Browser" }
      )
      vim.api.nvim_set_keymap(
        "v",
        "<leader>go",
        '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
        { silent = true, desc = "[G]it [O]pen in Browser" }
      )
    end,
  },
  {
    "FabijanZulj/blame.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gb", "<cmd>BlameToggle virtual<cr>", desc = "[G]it [B]lame" },
    },
    opts = {
      -- width - number - fixed width of the window (default: width of longest blame line + 8)
      -- date_format - string - Pattern for the date (default: "%Y/%m/%d %H:%M")
      -- virtual_style - "right_align" or "float" - Float moves the virtual text close to the content of the file. (default : "right_align")
      date_format = "%Y-%m-%d",
      virtual_style = "right",
    },
  },
}
