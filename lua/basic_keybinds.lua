vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = 'Write file'})

vim.keymap.set({'n', 'x'}, 'cp', '"+y', { desc = 'Copy into clipboard' })
vim.keymap.set({'n', 'x'}, 'cv', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set({'n', 'x'}, 'x', '"_x', { desc = 'Delete without modifying internal memory' })

vim.keymap.set('n', '<leader>a', 'keepjumps normal! ggVG<cr>', { desc = 'Select all text' })
