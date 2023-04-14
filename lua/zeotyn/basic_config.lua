vim.opt.backup         = false
vim.opt.clipboard      = 'unnamedplus'
vim.opt.cmdheight      = 1
-- vim.opt.completeopt    = { 'menu', 'menuone', 'noinsert' }
vim.opt.completeopt    = { 'menu', 'noselect' }
vim.opt.conceallevel   = 0
vim.opt.fileencoding   = "utf-8"
vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.incsearch      = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.mouse          = 'a'
vim.opt.wrap           = false
vim.opt.breakindent    = true

vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.shiftround     = true
vim.opt.expandtab      = true

vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.autoindent     = true
vim.opt.showmode       = false
vim.opt.smartindent    = true
vim.opt.cindent        = false
vim.opt.splitright     = true
vim.opt.splitbelow     = true
vim.opt.swapfile       = false
vim.opt.undofile       = true
vim.opt.writebackup    = false
vim.opt.showtabline    = 2
vim.opt.cursorline     = true
vim.opt.numberwidth    = 3
vim.opt.signcolumn     = "yes"
vim.opt.scrolloff      = 8
vim.opt.sidescrolloff  = 8
vim.opt.timeoutlen     = 300
vim.opt.timeout        = true
vim.opt.updatetime     = 250

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
vim.opt.termguicolors = true
