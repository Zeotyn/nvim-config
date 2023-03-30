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
      manage_nvim_cmp = true,
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

    local luasnip = require('luasnip')
    cmp.setup({
      sources = {
        { name = "luasnip" },
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
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
-- return {
--   'neovim/nvim-lspconfig',
--   enable = false,
--   dependencies = {
--     'hrsh7th/nvim-cmp',
--     'hrsh7th/cmp-buffer',
--     'hrsh7th/cmp-path',
--     'L3MON4D3/LuaSnip',
--     'L3MON4D3/LuaSnip',
--     'rafamadriz/friendly-snippets',
--     'williamboman/mason.nvim',
--     'williamboman/mason-lspconfig.nvim',
--     'hrsh7th/cmp-nvim-lsp'
--   },
--   config = function()
--     require('mason').setup({})
--     require('mason-lspconfig').setup()
--
--     local lspconfig = require('lspconfig')
--     local lsp_defaults = lspconfig.util.default_config
--
--     lsp_defaults.capabilities = vim.tbl_deep_extend(
--       'force',
--       lsp_defaults.capabilities,
--       require('cmp_nvim_lsp').default_capabilities()
--     )
--
--     lspconfig.lua_ls.setup({
--       single_file_support = true,
--       flags = {
--         debounce_text_changes = 150,
--       },
--     })
--
--     require('luasnip.loaders.from_vscode').lazy_load()
--
--     local cmp = require('cmp')
--     local luasnip = require('luasnip')
--
--     local select_opts = { behavior = cmp.SelectBehavior.Select }
--
--     cmp.setup({
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end
--       },
--       completion = {
--         completeopt = 'menu,menuone,noinsert'
--       },
--       sources = {
--         { name = 'path' },
--         { name = 'nvim_lsp', keyword_length = 1 },
--         { name = 'buffer',   keyword_length = 3 },
--         { name = 'luasnip',  keyword_length = 2 },
--       },
--       window = {
--         documentation = cmp.config.window.bordered()
--       },
--       formatting = {
--         fields = { 'menu', 'abbr', 'kind' },
--         format = function(entry, item)
--           local menu_icon = {
--             nvim_lsp = 'λ',
--             luasnip = '⋗',
--             buffer = 'Ω',
--             path = '🖫',
--           }
--
--           item.menu = menu_icon[entry.source.name]
--           return item
--         end,
--       },
--       mapping = {
--         ['<CR>'] = cmp.mapping.confirm({ select = true }),
--         ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
--         ['<Down>'] = cmp.mapping.select_next_item(select_opts),
--         ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
--         ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
--         ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-d>'] = cmp.mapping.scroll_docs(4),
--         ['<C-e>'] = cmp.mapping.abort(),
--         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--         ['<C-f>'] = cmp.mapping(function(fallback)
--           if luasnip.jumpable(1) then
--             luasnip.jump(1)
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--         ['<C-b>'] = cmp.mapping(function(fallback)
--           if luasnip.jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--         ['<Tab>'] = cmp.mapping(function(fallback)
--           local col = vim.fn.col('.') - 1
--
--           if cmp.visible() then
--             cmp.select_next_item(select_opts)
--           elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--             fallback()
--           else
--             cmp.complete()
--           end
--         end, { 'i', 's' }),
--         ['<S-Tab>'] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item(select_opts)
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--       }
--     })
--   end
-- }
