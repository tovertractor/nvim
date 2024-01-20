local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				['<C-k>'] = actions.move_selection_previous,
				['<C-j>'] = actions.move_selection_next,
			}
		}
	}
}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})
