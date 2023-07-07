require('etdavila.set')
require('etdavila.remap')
require('etdavila.lazy')

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'html', 'text', 'markdown', 'latex' },
    callback = function()
        vim.opt.spell = true
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'text', 'markdown', 'latex' },
    callback = function()
        vim.opt.wrap = true
    end
})
