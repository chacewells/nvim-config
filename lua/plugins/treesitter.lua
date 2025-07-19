return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      -- Enable automatic installation of parsers
      auto_install = true,
      
      -- List of parsers to always install (optional)
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "java",
        "javascript",
        "typescript",
        "python",
        "json",
        "yaml",
        "markdown",
        "bash",
        -- Add more languages as needed
      },
      
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      
      -- Enable syntax highlighting
      highlight = {
        enable = true,
        -- Disable for large files (optional performance optimization)
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      
      -- Enable incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      
      -- Enable indentation based on treesitter
      indent = {
        enable = true,
        -- Disable for certain languages if problematic
        disable = { "python" }, -- Python indentation can be tricky
      },
    })
  end,
}
