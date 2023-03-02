-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- create a personal augroup
local function augroup(name)
  return vim.api.nvim_create_augroup("reified_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("softindent_two"),
  pattern = {
    "clojure",
    "ruby",
    "vim",
    "lua",
  },
  command = "setlocal sw=2 sts=2 et",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("softindent_four"),
  pattern = { "cpp" },
  command = "setlocal sw=4 sts=4 et",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("hardindent_four"),
  pattern = { "make" },
  command = "setlocal sw=4 ts=4 noet",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("hardindent_eight"),
  pattern = { "c" },
  command = "setlocal sw=8 ts=8 noet",
})
