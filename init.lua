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
        width = 40,
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

-- terminal mappings
-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
-- vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
-- vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
-- vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
-- vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- optional: run tests in a floating terminal/buffer instead of blocking Vim:
-- vim.g["test#strategy"] = "neovim"

-- pick the GradleTest runner (not the default “test” command)
vim.g["test#java#runner"] = "gradletest"

-- point it at your wrapper (omit the “test” subcommand here!)
vim.g["test#java#gradletest#executable"] = "./gradlew"

-- whenever the working directory changes...
-- vim.api.nvim_create_autocmd("DirChanged", {
--   pattern = "*",
--   callback = function(ev)
--     -- ev.data.cwd is the new directory
--     vim.notify("Dir changed ➜ " .. vim.fn.getcwd(), vim.log.levels.INFO)
-- 
--     -- if you wanted to force vim-test to re-detect your project root,
--     -- you could clobber the root markers here, e.g.:
--     vim.g["test#project_root"] = vim.fn.getcwd()
-- 
--     -- …or even automatically cd back up to your real repo root:
--     -- local root = vim.fn.finddir('.git', ev.data.cwd .. ';')
--     -- if root ~= '' then vim.cmd('lcd ' .. vim.fn.fnamemodify(root, ':h')) end
--   end,
-- })

