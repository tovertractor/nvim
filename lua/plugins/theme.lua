--vim.o.background = 'dark'  -- Change to 'light' for light version
--vim.cmd('colorscheme PaperColor')

if vim.fn.has('termguicolors')then
	vim.o.termguicolors = true
end

vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1
vim.cmd('colorscheme sonokai')

