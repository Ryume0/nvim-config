---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
function gh(repo) return 'https://github.com/' .. repo end
require("config.options")
require("config.keymaps")
require("plugins.telescope")
require("plugins.ui")
require("plugins.lsp")
require("plugins.format")
require("plugins.autocomplete")
require("plugins.treesitter")
require("plugins.tree")
require("plugins.copilot")
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

