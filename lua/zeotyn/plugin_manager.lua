local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = 'zeotyn.plugins' },
  { import = 'zeotyn.plugins.lsp' },
  { import = 'zeotyn.plugins.editor' },
  { import = 'zeotyn.plugins.coding' },
  { import = 'zeotyn.plugins.mini' },
  { import = 'zeotyn.plugins.util' },
})
