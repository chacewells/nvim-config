return {
  -- Mason: Package manager for LSP servers, DAP servers, linters, and formatters
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },

  -- Mason-LSPConfig: Bridge between mason and lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-lspconfig').setup({
        -- Automatically install these language servers
        ensure_installed = {
          'jdtls',        -- Java
          'lua_ls',       -- Lua
          'pyright',      -- Python (example)
          -- Add more as needed
        },
        automatic_installation = true,
      })
    end
  },

  -- Optional: Mason-DAP for debug adapter protocols
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-nvim-dap').setup({
        ensure_installed = {
          'java-debug-adapter',
        },
        automatic_installation = true,
      })
    end
  }
}
