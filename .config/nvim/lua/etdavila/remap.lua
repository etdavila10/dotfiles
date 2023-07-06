vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--- Interacting with splits
vim.keymap.set('n', '<C-Down>', '<C-W>-', { silent = true })
vim.keymap.set('n', '<C-Up>', '<C-W>+', { silent = true })
vim.keymap.set('n', '<C-Left>', '<C-W><', { silent = true })
vim.keymap.set('n', '<C-Right>', '<C-W>>', { silent = true })

--- Close current buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv'")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv'")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>p', "\"_dP")

vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format()
end)

---------------------------------------
-------- Macaulay2 Keybinds -----------
---------------------------------------
--- vim.keymap.set('n', '<F12>', ':TermExec size=80 direction=vertical cmd="M2"<CR>', {noremap = true, silent = true})
--- vim.keymap.set('n', '<F11>', ':ToggleTermSendCurrentLine<CR>j', {noremap = true, silent = true})
--- vim.keymap.set('v', '<F11>', ':ToggleTermSendVisualLines<CR>', {noremap = true, silent = true})
