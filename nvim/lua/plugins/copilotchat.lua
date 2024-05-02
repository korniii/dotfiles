return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
      { "nvim-telescope/telescope.nvim" }, -- for telescope help actions (optional)
    },
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = true, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
      prompts = {
        Grammar = {
          prompt = "Fix grammar and typos.",
          mapping = "<leader>ccg",
          description = "CopilotChat - FixGrammar",
        },
      },
      language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      {
        "<leader>ccb",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat with buffer",
      },
      { "<leader>ccc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle chat window" },
      { "<leader>ccd", "<cmd>CopilotChatDocs<cr>", mode = "v", desc = "CopilotChat - Toggle chat window" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", mode = "v", desc = "CopilotChat - Generate tests" },
      { "<leader>cco", "<cmd>CopilotChatOptimize<cr>", mode = "v", desc = "CopilotChat - Optimize code" },
      { "<leader>ccC", "<cmd>CopilotChatCommit<cr>", mode = "n", desc = "CopilotChat - Commit message all" },
      { "<leader>ccS", "<cmd>CopilotChatCommitStaged<cr>", mode = "n", desc = "CopilotChat - Commit message staged" },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
    },
  },
}
