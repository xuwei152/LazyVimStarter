-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.cmdheight = 0
vim.opt.relativenumber = true
vim.opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.o.clipboard = "unnamedplus"
vim.o.history = 10000
vim.o.swapfile = false
vim.opt.shada:append("'1000")
vim.o.swapfile = false

vim.g.clipboard = {
  name = "xclip",
  copy = {
    ["+"] = "xsel -ib",
    ["*"] = "xsel -ib",
  },
  paste = {
    ["+"] = "xsel -ob",
    ["*"] = "xsel -ob",
  },
  cache_enabled = true,
}
