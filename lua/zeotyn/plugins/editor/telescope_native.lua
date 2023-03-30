return {
  'nvim-telescope/telescope-fzf-native.nvim',
  -- NOTE: If you are having trouble with this installation,
  --       refer to the README for telescope-fzf-native for more instructions.
  build = 'make',
  cond = function()
    pcall(require("telescope").load_extension, 'fzf')
    return vim.fn.executable 'make' == 1
  end,
}
