return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    opts = {
      model = "claude-opus-4.6",
      prompts = {
        Grammar = {
          prompt = "Fix grammar and typos of the text.",
        },
      },
    },
  },
}
