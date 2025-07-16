-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = "Find Files" },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',   desc = 'Live Grep'      },
        { '<leader>fs', function()
            require('telescope.builtin').grep_string{
                search = vim.fn.input("Grep for > "),
            }
        end,
        desc = 'Grep for user input'
    },
    { '<leader>fw', function()
        require('telescope.builtin').grep_string{
            search = vim.fn.expand('<cword>'),
        }
        end,
        desc = 'Grep for word under cursor'
    },
  },
  opts = {
      defaults = {
          -- your other defaults…
          mappings = {
              i = {
                  ['<C-f>'] = 'grep_string',   -- you can also bind it inside Telescope
              },
          },
      },
  },
  config = function(_, opts)
      require('telescope').setup(opts)
      -- load any extensions here, e.g.:
      -- require('telescope').load_extension('fzf')
  end,
}

