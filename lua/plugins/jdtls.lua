return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',  -- Optional: for debugging support
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local jdtls = require('jdtls')
    
    -- Find root of project
    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = require('jdtls.setup').find_root(root_markers)
    
    -- Eclipse jdtls location (adjust path as needed)
    local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    
    if launcher_jar == "" then
      vim.notify("jdtls not found. Install via Mason: :MasonInstall jdtls", vim.log.levels.ERROR)
      return
    end
    
    -- Configuration
    local config = {
      cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', launcher_jar,
        '-configuration', jdtls_path .. '/config_linux',  -- or config_mac/config_win
        '-data', vim.fn.expand('~/.cache/jdtls-workspace/') .. vim.fn.fnamemodify(root_dir, ':p:h:t'),
      },
      
      root_dir = root_dir,
      
      settings = {
        java = {
          eclipse = {
            downloadSources = true,
          },
          configuration = {
            updateBuildConfiguration = "interactive",
          },
          maven = {
            downloadSources = true,
          },
          gradle = {
            downloadSources = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },
          referencesCodeLens = {
            enabled = true,
          },
          references = {
            includeDecompiledSources = true,
          },
          format = {
            enabled = true,
          },
        },
        signatureHelp = { enabled = true },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
          },
        },
        contentProvider = { preferred = 'fernflower' },
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
        codeGeneration = {
          toString = {
            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
          },
          useBlocks = true,
        },
      },
      
      flags = {
        allow_incremental_sync = true,
      },
      
      init_options = {
        bundles = {},
      },
    }
    
    -- Start jdtls
    jdtls.start_or_attach(config)
  end,
}
