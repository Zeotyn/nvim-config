return {
  'ray-x/lsp_signature.nvim',
  enabled = false,
  config = function()
    require('lsp_signature').setup()
  end
}
