-- =========================================================================
-- NEOVIM MINIMALIST CONFIG — ROYAL SHEIKAH (SYSTEM / MAIL / QUICK EDITS)
-- =========================================================================

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = ""
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.wrap = true
opt.linebreak = true
opt.scrolloff = 6
opt.signcolumn = "yes"
opt.updatetime = 250
opt.undofile = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true

local function apply_royal_sheikah()
  local hl = vim.api.nvim_set_hl
  hl(0, "Normal",       { fg = "#e5e5e7", bg = "NONE" })
  hl(0, "NormalFloat",  { fg = "#e5e5e7", bg = "#1c1c1e" })
  hl(0, "CursorLine",   { bg = "#242629" })
  hl(0, "CursorLineNr", { fg = "#d4af37", bold = true })
  hl(0, "LineNr",       { fg = "#5c6370" })
  hl(0, "Visual",       { fg = "#1c1c1e", bg = "#00e5ff", bold = true })
  hl(0, "Search",       { fg = "#1c1c1e", bg = "#d4af37", bold = true })
  hl(0, "IncSearch",    { fg = "#1c1c1e", bg = "#00e5ff", bold = true })
  hl(0, "StatusLine",   { fg = "#e5e5e7", bg = "#1c1c1e" })
  hl(0, "StatusLineNC", { fg = "#6e7681", bg = "#1c1c1e" })
  hl(0, "VertSplit",    { fg = "#4e544b" })
  hl(0, "WinSeparator", { fg = "#4e544b" })
  hl(0, "Comment",      { fg = "#6e7681", italic = true })
  hl(0, "Keyword",      { fg = "#d4af37", bold = true })
  hl(0, "Function",     { fg = "#00e5ff", bold = true })
  hl(0, "String",       { fg = "#7ee787" })
  hl(0, "Type",         { fg = "#00e5ff" })
  hl(0, "Constant",     { fg = "#d4af37" })
  hl(0, "Identifier",   { fg = "#e5e5e7" })
  hl(0, "ErrorMsg",     { fg = "#ff5555", bold = true })
  hl(0, "WarningMsg",   { fg = "#d4af37", bold = true })
end

apply_royal_sheikah()

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "mail", "markdown", "gitcommit" },
  callback = function()
    opt.textwidth = 72
    opt.colorcolumn = "72"
  end,
})

vim.g.mapleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>s", "<cmd>setlocal spell! spelllang=fr,en<CR>", { desc = "Toggle FR/EN spellcheck" })
