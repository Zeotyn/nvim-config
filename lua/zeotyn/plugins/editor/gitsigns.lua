return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '➤' },
        topdelete = { text = '➤' },
        changedelete = { text = '▎' },
      },
      signcolumn = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      on_attach = function(bufnr)
        vim.wo.signcolumn = 'yes'

        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Show hunk changes' })
        -- map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Blame current line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Diff file' })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Diff file' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'Show deleted changes' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    })
  end
}
