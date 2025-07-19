return {
    {
        "rcasia/neotest-java",
        ft = "java",
        dependencies = {
            "mfussenegger/nvim-jdtls",
            "mfussenegger/nvim-dap", -- for the debugger
            "rcarriga/nvim-dap-ui", -- recommended
            "theHamsta/nvim-dap-virtual-text", -- recommended
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-java")({
                        ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
                    }),
                },
            })

            -- Neotest keymappings for normal mode
            local keymap = vim.keymap.set

            -- Test panel and summary
            keymap('n', '<leader>to', function() require('neotest').output_panel.toggle() end, { desc = 'Toggle test output panel' })
            keymap('n', '<leader>ts', function() require('neotest').summary.toggle() end, { desc = 'Toggle test summary' })

            -- Run tests
            keymap('n', '<leader>tn', function() require('neotest').run.run() end, { desc = 'Test nearest' })
            keymap('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, { desc = 'Test file' })
            keymap('n', '<leader>tp', function() require('neotest').run.run(vim.loop.cwd()) end, { desc = 'Test project' })

            -- Stop testing
            keymap('n', '<leader>tS', function() require('neotest').run.stop() end, { desc = 'Stop testing' })
        end,
    }
}
