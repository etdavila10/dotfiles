vim.opt.number = true

vim.opt.mouse = 'a'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.breakindent = true

vim.opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.completeopt = 'menuone, noselect'

vim.opt.updatetime = 50
vim.opt.colorcolumn = '80'

vim.opt.spelllang = 'en_US'
vim.opt.background = 'dark'