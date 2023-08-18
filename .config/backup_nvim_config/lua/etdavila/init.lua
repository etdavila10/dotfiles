require('etdavila.set')
require('etdavila.remap')
require('etdavila.lazy')

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'html', 'text', 'markdown', 'tex' },
    callback = function()
        vim.opt.spell = true
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = 'netrw',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<C-l>', ':TmuxNavigateRight<CR>',
            { silent = true, noremap = true })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'text', 'markdown', 'tex' },
    callback = function()
        vim.opt.wrap = true
        vim.opt.linebreak = true
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        'markdown',
        'html',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'css',
        'bib',
        'json',
        'sass',
        'scss'
    },
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end
})
