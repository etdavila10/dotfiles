-------------------------------------------------
------------ GENERAL CONFIGURATION --------------
-------------------------------------------------

--- Already set by default
--vim.opt.syntax = 'on'
--vim.opt.filetype = 'on'
--vim.opt.filetype.plugin = 'on'
--vim.opt.filetype.indent = 'on'
vim.opt.foldlevel = 99
-- vim.opt.encoding = 'utf-8'

-- Use case insensitive search, except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Doesn't show 'INSERT' twice
vim.opt.showmode = false

-- Display line numbers on the left
vim.opt.number = true
vim.opt.signcolumn = 'yes'

-- Mouse support
vim.opt.mouse = 'a'

-- Creates a column at line 80 to not pass it
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.linebreak = true
vim.opt.textwidth = 80
vim.opt.whichwrap = "h,l"

-- Show existing tab with 4 spaces width
vim.opt.tabstop = 4
-- When indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4
-- On pressing tab, insert 4 spaces
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Persistent undoing
vim.opt.undofile = true
local home_path = vim.fn.expand('$HOME')
vim.opt.undodir = home_path .. '/.config/nvim/undo'

-- Goes to directory where file is
vim.opt.autochdir = true

-- Splits to the right instead of vertical
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.spelllang = "en_us"

---------------------------------------
---------- Autocommands ---------------
---------------------------------------

--- Markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt.spell = true
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

--- CSS
vim.api.nvim_create_autocmd("FileType", {
    pattern = "css",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

--- Text
vim.api.nvim_create_autocmd("FileType", {
    pattern = "text",
    callback = function()
        vim.opt.spell = true
    end
})

--- HTML
vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
        -- vim.keymap.set('n', '<leader>m', ':!google-chrome-stable % &<CR>')
        vim.opt.spell = true
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

--- Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        -- vim.keymap.set('n', '<leader>m', ':!python3 %<CR>')
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

--- Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        -- vim.keymap.set('n', '<leader>m', ':!python3 %<CR>')
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
    end
})

--- LaTeX
--vim.api.nvim_create_autocmd("FileType", {
    --pattern = {"tex", "plaintex", "context"},
    --callback = function()
        ----vim.opt_local.indentexpr = ''
        ---- vim.keymap.set('n', '<leader>m', ':!python3 %<CR>')
        --vim.opt.tabstop = 2
        --vim.opt.shiftwidth = 2
        ----vim.g.vimtex_indent_enabled = 0
    --end
--})


---------------------------------------
----------- Keybindings ---------------
---------------------------------------

local opts = {noremap = true}

--- Set up leader key
vim.keymap.set('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

--- Remove keys
vim.keymap.set('n', '<UP>', '<Nop>', opts)
vim.keymap.set('n', '<DOWN>', '<Nop>', opts)
vim.keymap.set('n', '<LEFT>', '<Nop>', opts)
vim.keymap.set('n', '<RIGHT>', '<Nop>', opts)
vim.keymap.set('n', '<ESC>', '<Nop>', opts)

--- New line but stay in normal mode
vim.keymap.set('n', '<CR>', 'o<Esc>k', opts)
vim.keymap.set('n', '<BS>', 'O<Esc>j', opts)

--- Interacting with splits
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', opts)
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', opts)
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', opts)
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', opts)
vim.keymap.set('n', '<C-Down>', '<C-W>-', opts)
vim.keymap.set('n', '<C-Up>', '<C-W>+', opts)
vim.keymap.set('n', '<C-Left>', '<C-W><', opts)
vim.keymap.set('n', '<C-Right>', '<C-W>>', opts)
vim.keymap.set('n', '<C-=>', '<C-W>=', opts)
vim.keymap.set('n', '<C-M>', '<C-W><C-_>', opts)
vim.keymap.set('n', '<C-N>', '<C-W>|', opts)

--- Turn off highlighted text
vim.keymap.set('n', '<leader>n', ':nohl<CR>', {noremap = true, silent = true})
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)


---------------------------------------
-------- Macaulay2 Keybinds -----------
---------------------------------------
--- vim.keymap.set('n', '<F12>', ':TermExec size=80 direction=vertical cmd="M2"<CR>', {noremap = true, silent = true})
--- vim.keymap.set('n', '<F11>', ':ToggleTermSendCurrentLine<CR>j', {noremap = true, silent = true})
--- vim.keymap.set('v', '<F11>', ':ToggleTermSendVisualLines<CR>', {noremap = true, silent = true})

---------------------------------------
-------- Nvim-Tree Keybinds -----------
---------------------------------------
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true})
vim.keymap.set('n', '<leader>c', ':NvimTreeCollapse<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>]', ':NvimTreeResize +20<CR>', {noremap = true})
vim.keymap.set('n', '<leader>[', ':NvimTreeResize -20<CR>', {noremap = true})

---------------------------------------
-------- Bufferline Keybinds ----------
---------------------------------------
vim.keymap.set('n', '<C-1>', ':BufferLineGoToBuffer 1<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-2>', ':BufferLineGoToBuffer 2<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-3>', ':BufferLineGoToBuffer 3<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-4>', ':BufferLineGoToBuffer 4<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-5>', ':BufferLineGoToBuffer 5<CR>', {noremap = true, silent = true})

--- Next/Prev tab
vim.keymap.set('n', '<C-]>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-[>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})

--- Move tab to Next/Prev
-- vim.keymap.set('n', '<C-}>', ':BufferLineMoveNext<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-{>', ':BufferLineMovePrev<CR>', {noremap = true, silent = true})

--- Select a tab to close
vim.keymap.set('n', '<leader>d', ':BufferLinePickClose<CR>', {noremap = true, silent = true})

---------------------------------------
----------- LSP Keybinds --------------
---------------------------------------
---- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>f', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})

---------------------------------------
--------------- COLORS ----------------
---------------------------------------

vim.o.background = 'dark'
vim.opt.termguicolors = true

require "plugins"
