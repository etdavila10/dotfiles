-------------------------------
---- GENERAL CONFIGURATION ----
-------------------------------
local exec = vim.api.nvim_exec
local set = vim.opt
local cmd = vim.cmd
local g = vim.g

set.termguicolors = true
set.list = true

vim.o.hlsearch
g.mapleader = ' '
g.maplocalleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.number = true
vim.opt.signcolumn = 'yes'
vim.opt.mouse = 'a'
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
