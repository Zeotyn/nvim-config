return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },         -- Required
    { 'hrsh7th/cmp-nvim-lsp' },     -- Required
    { 'hrsh7th/cmp-buffer' },       -- Optional
    { 'hrsh7th/cmp-path' },         -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' },     -- Optional
    { 'hrsh7th/cmp-cmdline' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },             -- Required
    { 'molleweide/LuaSnip-snippets.nvim' },
    { 'rafamadriz/friendly-snippets' }, -- Optional
    { 'folke/neodev.nvim' }
  },
  config = function()
    require('neodev').setup({})
    local lsp = require('lsp-zero').preset({
      name = 'recommended',
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      set_lsp_keymaps = false,
      configure_diagnostics = true,
      cmp_capabilities = true,
      manage_nvim_cmp = false,
      call_servers = 'local',
      sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
      }
    })

    local cmp = require('cmp')
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
          {
            name = 'path'
          }
        },
        {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          }
        })
    })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = nil }
    )


    local luasnip = require('luasnip')
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
          local short_name = {
            nvim_lsp = 'LSP',
            nvim_lua = 'nvim'
          }

          local menu_name = short_name[entry.source.name] or entry.source.name

          item.menu = string.format('[%s]', menu_name)
          return item
        end,
      },
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'buffer',   keyword_length = 3 },
        { name = 'luasnip',  keyword_length = 2 },
      },
      window = {
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        -- confirm selection
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),
        -- navigate items on the list
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        -- scroll up and down in the completion documentation
        ['<C-d>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
        -- toggle completion
        ['<C-e>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()
            fallback()
          else
            cmp.complete()
          end
        end),
        -- go to next placeholder in the snippet
        ['<C-f>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        -- go to previous placeholder in the snippet
        ['<C-b>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        -- when menu is visible, navigate to next item
        -- when line is empty, insert a tab character
        -- else, activate completion
        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item(cmp_select_opts)
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, { 'i', 's' }),
        -- when menu is visible, navigate to previous item on list
        -- else, revert to default behavior
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(cmp_select_opts)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
    })

    lsp.ensure_installed({
      'kotlin_language_server',
      'jdtls',
      'lua_ls',
      'yamlls',
      'pyright',
      'lemminx',
      'rust_analyzer',
      'jsonls',
      'tsserver',
      'vimls'
    })

    lsp.configure('lua_ls', {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace'
          }
        }
      }
    })

    lsp.skip_server_setup({ 'jdtls' })
    -- (Optional) Configure lua language server for neovim
    lsp.nvim_workspace({
      library = vim.api.nvim_get_runtime_file('', true)
    })

    require("luasnip.loaders.from_snipmate").load({ path = { "../../../../snippets" } })

    lsp.on_attach(function(_, bufnr)
      local bind = function(keys, func, desc, mode)
        local m = mode or 'n'
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set(m, keys, func, { buffer = bufnr, desc = desc })
      end
      bind('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace add folder')
      bind('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace remove folder')
      bind('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, 'Workspace list folders')
    end)

    lsp.setup()
    vim.diagnostic.config({
      virtual_text = true
    })
  end
}
