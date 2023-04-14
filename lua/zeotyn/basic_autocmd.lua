local augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'man' },
  group = augroup,
  desc = 'Use q to close the window',
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Autoformat on save',
  callback = function(opts)
    if vim.bo[opts.buf].filetype == 'java' then
      return
    end
    vim.lsp.buf.format()
  end
})
