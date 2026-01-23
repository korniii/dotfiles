return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    opts = {
      model = "claude-sonnet-4.5",
      prompts = {
        Grammar = {
          prompt = "Fix grammar and typos of the text.",
        },
      },
    },
  },
}
