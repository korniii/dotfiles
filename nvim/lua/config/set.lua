vim.scriptencoding = "utf-8"

vim.opt.fileencoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.scrolloff = 999

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.opt.wrap = true
-- wait for nvim 0.10
-- vim.opt.smoothscroll = true

vim.opt.shiftwidth = 2
vim.bo.expandtab = true
vim.opt.tabstop = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "0"
