---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Tmux Navigator left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Tmux Navigator right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Tmux Navigator down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Tmux Navigator up" },

    -- Toggle wordwrap
    ["<leader>ww"] = { "<cmd> set wrap! <CR>", "Toggle wordwrap" },
  },

}

M.telescope = {
  plugin = true,

  n = {
    -- [c]olor [s]chemes
    ["<leader>cs"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" }
  }
}

M.lspconfig = {
  plugin = true,

  -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

  n = {
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    }
  }
}

M.vimtex = {
  plugin = true,
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add file to Harpoon",
    },
    ["<leader>h"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Open Harpoon Explorer",
    },
    ["<leader>j"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Navigate to next Harpoon file",
    },
    ["<leader>k"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Navigate to prev Harpoon file",
    }
  }
}

M.toggleterm = {
  n = {
    ["<leader>th"] = { "<cmd> ToggleTerm size=40 direction=horizontal <CR>", "Open Horizontal Terminal" },
    ["<leader>tv"] = { "<cmd> ToggleTerm size=80 direction=vertical <CR>", "Open Vertical Terminal" },
    ["<leader>tt"] = { "<cmd> ToggleTerm <CR>", "Toggle Terminal" },
    [";"] = {
      "<cmd> ToggleTermSendCurrentLine <CR>j",
      "Send current line to Terminal",
      opts = { nowait = true }
    }
  },
  v = {
    [";"] = {
      "<cmd> ToggleTermSendVisualLines <CR>j",
      "Send selected lines to Terminal",
      opts = { nowait = true }
    }
  },
  t = {
    ["<esc>"] = { "<C-\\><C-n>", "To Terminal Normal Mode" },
  }
}

return M
