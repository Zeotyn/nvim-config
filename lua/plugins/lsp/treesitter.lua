return {
  'nvim-treesitter/nvim-treesitter', 
  build = ":TSUpdate",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'c', 
        'css',
        'gitcommit',
        'gitignore',
        'go',
        'graphql',
        'help',
        'html',
        'java',
        'javascript',
        'json',
        'kotlin',
        'lua',
        'php',
        'python',
        'regex',
        'ruby',
        'rust',
        'scss',
        'swift',
        'tsx',
        'typescript',
        'vim',
        'vue',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn", -- @Todo: Change those to more useable ones.
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = {
        enable = true
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          }
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      }
    }
  end
}
