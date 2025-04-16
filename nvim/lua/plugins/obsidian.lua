return {
  "obsidian-nvim/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand("~") .. "/obsidian/korniii/**.md" },
  keys = {
    { "<leader>o", "", desc = "+Obsidian" },
    { "<leader>fO", "<cmd>ObsidianSearch<cr>", desc = "[O]bsidian [S]earch" },
    { "<leader>fo", "<cmd>ObsidianQuickSwitch<cr>", desc = "[O]bsidian [F]ind File" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "[O]bsidian [O]pen" },
    { "<leader>ob", "<Cmd>ObsidianBacklinks<CR>", desc = "[O]bsidian [B]acklinks" },
    { "<leader>on", ":ObsidianNewFromTemplate ", desc = "[O]bsidian [N]ew Note" },
    { "<leader>od", "<Cmd>ObsidianToday<CR>", desc = "[O]bsidian [D]aily Note" },
    { "<leader>ot", "<Cmd>ObsidianTomorrow<CR>", desc = "[O]bsidian [T]omorrows Note" },
    { "<leader>oy", "<Cmd>ObsidianYesterday<CR>", desc = "[O]bsidian [Y]esterdays Note" },
    { "<leader>or", "<Cmd>ObsidianRename<CR>", desc = "[O]bsidian [R]ename Note" },
  },
  opts = {
    dir = "~/notes/",
    notes_subdir = "/6 - Atomic Notes",
    daily_notes = {
      folder = "dailies",
      date_format = "%Y-%m-%d",
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
      new_notes_location = "current_dir",
    },
    open_app_foreground = true,
    picker = {
      name = "fzf-lua",
    },
    templates = {
      folder = "_templates",
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context: follow link, show notes with tag, or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    -- Optional, alternatively you can customize the frontmatter data.
    ---@return table
    note_frontmatter_func = function(note)
      local out = { tags = note.tags, aliases = note.aliases }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like 'my-new-note', and therefore the file name 'my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub("[^A-Za-z0-9 -]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix and prepend the current timestamp.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
        suffix = tostring(os.time()) .. "-" .. suffix
      end
      return suffix
    end,

    -- Optional, configure additional syntax highlighting / extmarks.
    -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
    ui = {
      enable = true, -- set to false to disable all additional syntax features
      update_debounce = 200, -- update delay after a text change (in milliseconds)
      -- Define how various check-boxes are displayed
      checkboxes = {},
      -- Use bullet marks for non-checkbox lists.
      bullets = {},
      external_link_icon = {},
      -- Replace the above with this if you don't have a patched font:
      -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
  },
}
