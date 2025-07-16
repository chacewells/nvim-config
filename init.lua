require("config.lazy")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Enable line numbers
vim.opt.number = true

-- Clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Keep indentation consistent
vim.opt.autoindent = true
vim.opt.expandtab  = true

-- Show the cursor position all the time
vim.opt.ruler = true

-- Make tabs insert 4 spaces, and shift operations use 4 spaces
vim.opt.tabstop    = 4
vim.opt.shiftwidth = 4

-- nvim-tree setup
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')

-- telescope setup
local ts = require('telescope')
ts.setup{
    init = function()
      -- restore old ft_to_lang API (if you still need it)
      vim.treesitter.ft_to_lang = require('nvim-treesitter.parsers').ft_to_lang
    end,
    defaults = {
        preview = {
          treesitter = false,
        },
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        path_display = { "shorten" },
        file_ignore_patterns = { "node_modules", "%.git/" },
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-c>"] = "close",
            },
            n = {
                ["q"] = "close",
            },
        },
    },
}

vim.keymap.set(
  'n',
  '<leader>fp',
  ts.extensions.project.project,
  { desc = "Telescope Projects" }
)

