local keymap = vim.keymap.set

keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '



keymap('n', '<leader>w', '<cmd>write<cr>', { desc = 'Write file' })
keymap('n', '<leader>qq', '<cmd>quit<cr>', { desc = 'Quit' })
keymap('n', '<leader>qw', '<cmd>Bdelete<cr>', { desc = 'Quit file' })
keymap('n', '<leader>qa', '<cmd>quitall<cr>', { desc = 'Quit vim' })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- keymap({ 'n', 'x', 'v' }, '<leader>c', '"+y', { desc = 'Copy into clipboard' })
-- keymap({ 'n', 'x', 'v' }, '<leader>v', '"+p', { desc = 'Paste from clipboard' })
keymap({ 'n', 'x', 'v' }, '<C-x>', '"+x', { desc = 'Cut into clipboard' })
keymap({ 'n', 'x', 'v' }, 'x', '"_x', { desc = 'Delete without modifying internal memory' })
keymap({ 'n', 'x', 'v' }, 'd', '"_d', { desc = 'Delete without modifying internal memory' })
keymap({ 'n', 'x', 'v', 'i' }, '<C-z>', 'u')
keymap({ 'n', 'x', 'v' }, '<leader>c', 'none')

--keymap('n', '<leader>a', 'keepjumps normal! ggVG<cr>', { desc = 'Select all text' })
-- Show lsp log
keymap('n', '<leader>el', '<cmd>lua vim.cmd(\'e\'..vim.lsp.get_log_path())<cr>', { desc = 'Load logs of lsp' })

-- Switch windows
keymap("n", "<C-h>", "<C-w>h", { desc = 'Switch to left window' })
keymap("n", "<C-j>", "<C-w>j", { desc = 'Switch to down window' })
keymap("n", "<C-k>", "<C-w>k", { desc = 'Switch to up window' })
keymap("n", "<C-l>", "<C-w>l", { desc = 'Switch to right window' })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = 'Resize window to the up' })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = 'Resize window to the down' })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = 'Resize window to the left' })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = 'Resize window to the right' })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = 'Go to next buffer' })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = 'Go to previous buffer' })

-- Move text up and down in visual mode
keymap("v", "<S-j>", ":m .+1<CR>==", { desc = 'Move selected text down' })
keymap("v", "<S-k>", ":m .-2<CR>==", { desc = 'Move selected text up' })
keymap("v", "p", '"_dP', { desc = 'Paste without saving into clipboard' })
keymap("x", "J", ":move '>+1<CR>gv-gv", { desc = 'Move selected text down' })
keymap("x", "K", ":move '<-2<CR>gv-gv", { desc = 'Move selected text up' })
keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", { desc = 'Move selected text down' })
keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", { desc = 'Move selected text up' })


-- lsp
keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
keymap('n', '<C-p>', vim.lsp.buf.signature_help, { desc = 'Signature documentation' })
keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
keymap('n', 'gd', '<C-]> | :lua vim.lsp.buf.definition<cr>', { desc = 'Go to definition' })
keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
keymap('n', 'gI', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
keymap('n', 'gt', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
keymap('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename' })
