local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<C-d>"] = "delete_buffer"
                }
            }
        }
    }
})

--- pf for [p]roject [f]iles
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--- pb for [p]roject [b]uffers
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--- ps for [p]roject [s]earch
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') });
end, {})
