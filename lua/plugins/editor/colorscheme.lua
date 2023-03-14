return {
  'loctvl842/monokai-pro.nvim',
  config = function()
    require('monokai-pro').setup()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme('monokai-pro')
  end
}
