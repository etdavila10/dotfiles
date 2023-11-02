local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { 'windwp/nvim-ts-autotag' }
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = {
           enable = true,
          },
          shortcut = {
            {
              desc = '󰚰 Update Plugins',
              group = '@property',
              action = 'Lazy update',
              key = 'u'
            }
          }
        }
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    'karb94/neoscroll.nvim',
    event = 'VimEnter',
    config = function()
      require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                      '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,       -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,             -- Function to run after the scrolling animation ends
          performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      })
    end
  },
  { 'christoomey/vim-tmux-navigator', lazy = false },
  { 'theprimeagen/harpoon',
    lazy = false,
    init = function()
      require("core.utils").load_mappings "harpoon"
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      require('lualine').setup({
        options = {
          theme = 'onedark'
        }
      })
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    'lervag/vimtex',
    ft = "tex"
  },
  {
    "NvChad/nvterm",
    enabled = false
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = false,
    version = '*',
    config = function()
      require('toggleterm').setup()
    end
  }


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
