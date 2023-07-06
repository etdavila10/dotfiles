require('etdavila.set')
require('etdavila.remap')
require('etdavila.lazy')

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'html', 'text', 'markdown', 'latex' },
    callback = function()
        vim.opt.spell = true
    end
})
