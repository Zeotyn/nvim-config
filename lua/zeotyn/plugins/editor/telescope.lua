return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>',                desc = 'Find in files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>',                 desc = 'Find by grep' },
    { '<C-e>',      '<cmd>Telescope buffers<cr>',                   desc = 'Find in opened files' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>',                   desc = 'Find in opened files' },
    { '<leader>fe', '<cmd>Telescope oldfiles<cr>',                  desc = 'Find in recently files' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>',                 desc = 'Find in help tags' },
    { '<leader>fd', '<cmd>Telescope diagnostics<cr>',               desc = 'Find in diagnostic messages' },
    { '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>',      desc = 'Find in current open file' },
    { '<leader>fr', '<cmd>Telescope lsp_references<cr>',            desc = 'Find references of type behind cursor' },
    { "<leader>fo", "<cmd>Telescope vim_options<cr>",               desc = "Options" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>",                   desc = "Key Maps" },
    { "<leader>fc", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
    { "<leader>fC", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
    { "<C-f>",      "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },

  },
  config = function()
    require('telescope').setup()
  end
}
