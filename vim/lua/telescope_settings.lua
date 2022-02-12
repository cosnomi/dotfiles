require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

local builtin = require("telescope.builtin")
vim.keymap.set('n', 'zf', builtin.find_files, {noremap = true, silent = true})
vim.keymap.set('n', 'zg', builtin.live_grep, {noremap = true, silent = true})
vim.keymap.set('n', 'z8', builtin.grep_string, {noremap = true, silent = true})
vim.keymap.set('n', 'zb', builtin.buffers, {noremap = true, silent = true})
vim.keymap.set('n', 'zc', builtin.colorscheme, {noremap = true, silent = true})
vim.keymap.set('n', 'zp', builtin.registers, {noremap = true, silent = true})
vim.keymap.set('n', 'zk', builtin.current_buffer_fuzzy_find, {noremap = true, silent = true})
