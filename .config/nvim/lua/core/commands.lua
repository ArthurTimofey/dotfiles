vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax enable')

vim.api.nvim_create_user_command('Cap', 'execute(\'!cap "<args>"\')', { nargs = 1 })

-- when is press esc in terminal mode it will go to normal mode
vim.api.nvim_command('tnoremap <Esc> <C-\\><C-n>')
