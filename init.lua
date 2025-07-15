require("config.lazy")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Enable line numbers
vim.opt.number = true

-- Keep indentation consistent
vim.opt.autoindent = true
vim.opt.expandtab  = true

-- Show the cursor position all the time
vim.opt.ruler = true

-- Make tabs insert 4 spaces, and shift operations use 4 spaces
vim.opt.tabstop    = 4
vim.opt.shiftwidth = 4


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

-- keymap
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
