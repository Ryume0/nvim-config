vim.pack.add( { "https://github.com/zbirenbaum/copilot.lua"})
require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = false,
    keymap = {
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
  },
})

