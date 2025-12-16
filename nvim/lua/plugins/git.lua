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
    "esmuellert/vscode-diff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    branch = "next",
    cmd = "CodeDiff",
    config = function()
      require("vscode-diff").setup({
        -- Highlight configuration
        highlights = {
          -- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
          line_insert = "DiffAdd", -- Line-level insertions
          line_delete = "DiffDelete", -- Line-level deletions

          -- Character-level: accepts highlight group names or hex colors
          -- If specified, these override char_brightness calculation
          char_insert = nil, -- Character-level insertions (nil = auto-derive)
          char_delete = nil, -- Character-level deletions (nil = auto-derive)

          -- Brightness multiplier (only used when char_insert/char_delete are nil)
          -- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
          char_brightness = nil, -- Auto-adjust based on your colorscheme
        },

        -- Diff view behavior
        diff = {
          disable_inlay_hints = true, -- Disable inlay hints in diff windows for cleaner view
          max_computation_time_ms = 5000, -- Maximum time for diff computation (VSCode default)
        },

        -- Keymaps in diff view
        keymaps = {
          view = {
            quit = "q", -- Close diff tab
            toggle_explorer = "<leader>b", -- Toggle explorer visibility (explorer mode only)
            next_hunk = "]c", -- Jump to next change
            prev_hunk = "[c", -- Jump to previous change
            next_file = "]f", -- Next file in explorer mode
            prev_file = "[f", -- Previous file in explorer mode
          },
          explorer = {
            select = "<CR>", -- Open diff for selected file
            hover = "K", -- Show file diff preview
            refresh = "R", -- Refresh git status
          },
        },
      })
    end,
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
