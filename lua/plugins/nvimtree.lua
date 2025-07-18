return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
            -- 1) Keep tree in sync with your Neovim cwd
            respect_buf_cwd    = true,
            update_focused_file = {
                enable      = true,  -- focus file in tree on BufEnter
                update_root = true,  -- cd into folder of the file
            },

            -- 2) Turn on filesystem watching so new/deleted files show up instantly
            filesystem_watchers = {
                enable         = true,  -- uses Neovim’s libuv/FileSystemEvent API
                debounce_delay = 50,    -- ms to batch rapid fs events
            },

            -- (optional) show dotfiles, git status, etc.
            filters = { dotfiles = false },
            git = { enable = true, ignore = false },
        }

        -- 3) Add a handy manual refresh key (in case you want it)
        vim.keymap.set('n', '<leader>tr', '<cmd>NvimTreeRefresh<CR>', {
            desc = "🔄 Refresh NvimTree",
        })
    end,
}
