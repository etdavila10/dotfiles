-------------------------------------------------
------------ GENERAL CONFIGURATION --------------
-------------------------------------------------

-- `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

---------------------------------------------
------------ START OF LAZYNVIM --------------
---------------------------------------------
-- `:help lazy.nvim.txt`
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- LSP Config
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- `opts = {}` is teh same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      'folke/neodev.nvim'
    }
  },

  -- Keybind cheatsheet
  { 'folke/which-key.nvim', opts = {} },

  -- Git configs
  -- `:help gitsigns.txt`
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' }
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end
    }
  },

  -- Theme
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end
  },

  -- Statusline
  -- `:help lualine.txt`
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = ''
      }
    }
  },

  -- Add identation markers
  -- `:help indent_blankline.txt`
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false
    }
  },

  -- Commenting engine
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }, 'nvim-lua/plenary.nvim' }
  },

  -- Better algorithm for fuzzy finder
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    build = ':TSUpdate'
  }
}, {})
---------------------------------------------
------------- END OF LAZYNVIM ---------------
---------------------------------------------


---------------------------------------------
------------- SETTING OPTIONS ---------------
---------------------------------------------
-- `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Mouse support
vim.o.mouse = 'a'

-- `:help clipboard`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Persistent undoing
vim.o.undofile = true
local home_path = vim.fn.expand('$HOME')
vim.o.undodir = home_path .. '/.config/nvim/undo'

-- Case-insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Doesn't show 'INSERT' twice
vim.opt.showmode = false

-- Decrease update times
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Goes to directory where file is
vim.o.autochdir = false

-- Splits to the right instead of vertical
vim.o.splitbelow = true
vim.o.splitright = true

vim.bo.spelllang = "en_us"

vim.o.background = 'dark'
vim.o.termguicolors = true

---------------------------------------
---------- Autocommands ---------------
---------------------------------------

--- Set spell for specific languages
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "text", "markdown" },
    callback = function()
        vim.o.spell = true
    end
})

---------------------------------------
----------- Keybindings ---------------
---------------------------------------

--- Set up leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'k'", { expr = true, silent = true })

--- Interacting with splits
vim.keymap.set('n', '<C-Down>', '<C-W>-', { silent = true })
vim.keymap.set('n', '<C-Up>', '<C-W>+', { silent = true })
vim.keymap.set('n', '<C-Left>', '<C-W><', { silent = true })
vim.keymap.set('n', '<C-Right>', '<C-W>>', { silent = true })

--- Close current buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true })

--- Turn off highlighted text
vim.keymap.set('n', '<leader>n', ':nohl<CR>', { noremap = true, silent = true })

-- Highlight on yank
-- `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*'
})

-- Configure Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false
      }
    }
  }
}

pcall(require('telescope').load_extension, 'fzf')
require('telescope').load_extension "file_browser"

vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- open file_browser with the path of the current buffer
-- vim.api.nvim_set_keymap(
--   "n",
--   "<space>fb",
--   ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
--   { noremap = true }
-- )

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim', 'astro' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- rust_analyzer = {},
  astro = {},
  cssls = {},
  emmet_ls = {},
  eslint = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  pyright = {},
  marksman = {},
  tailwindcss = {},
  texlab = {},
  tsserver = {}
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

---------------------------------------
-------- Macaulay2 Keybinds -----------
---------------------------------------
--- vim.keymap.set('n', '<F12>', ':TermExec size=80 direction=vertical cmd="M2"<CR>', {noremap = true, silent = true})
--- vim.keymap.set('n', '<F11>', ':ToggleTermSendCurrentLine<CR>j', {noremap = true, silent = true})
--- vim.keymap.set('v', '<F11>', ':ToggleTermSendVisualLines<CR>', {noremap = true, silent = true})

---------------------------------------
-------- Bufferline Keybinds ----------
---------------------------------------
-- vim.keymap.set('n', '<C-1>', ':BufferLineGoToBuffer 1<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-2>', ':BufferLineGoToBuffer 2<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-3>', ':BufferLineGoToBuffer 3<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-4>', ':BufferLineGoToBuffer 4<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-5>', ':BufferLineGoToBuffer 5<CR>', {noremap = true, silent = true})

--- Next/Prev tab
--- vim.keymap.set('n', '<C-]>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-[>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})

--- Move tab to Next/Prev
-- vim.keymap.set('n', '<C-}>', ':BufferLineMoveNext<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<C-{>', ':BufferLineMovePrev<CR>', {noremap = true, silent = true})

--- Select a tab to close
-- vim.keymap.set('n', '<leader>d', ':BufferLinePickClose<CR>', {noremap = true, silent = true})

require "plugins"

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
