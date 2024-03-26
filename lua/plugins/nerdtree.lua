vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-1>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

--Start NERDTree and put the cursor back in the other window.
vim.api.nvim_exec('autocmd VimEnter * NERDTree | wincmd p', true)

--show lines in file
vim.api.nvim_set_var('NERDTreeFileLines', 1)

--show hidden files
vim.g.NERDTreeShowHidden=1
