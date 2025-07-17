return {
    'nvim-telescope/telescope-project.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
        local base_dirs = {
            '~/IdeaProjects',           -- scan all repos here
            '~/dev',                    -- scan all repos here
            '~/.config',                -- scan all repos here
        }
        -- Filter out non-existent directories
        local existing_dirs = {}
        for _, dir in ipairs(base_dirs) do
            local expanded_dir = vim.fn.expand(dir)
            if vim.fn.isdirectory(expanded_dir) == 1 then
                table.insert(existing_dirs, expanded_dir)
            end
        end
        
        -- 1) configure the extension
        require('telescope').setup {
            extensions = {
                project = {
                    -- point this at the folders where you actually keep your repos:
                    base_dirs = existing_dirs,
                    hidden_files = true,         -- include dotfiles?
                    order_by     = 'recent',     -- sort by last-used
                    sync_with_nvim_tree = true, -- keep nvim-tree in sync
                },
            },
        }
        -- 2) load it so :Telescope project actually exists
        require('telescope').load_extension('project')
    end,
}

