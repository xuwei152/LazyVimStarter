return{
  {
    "fasterius/simple-zoom.nvim",
    opts = {
      hide_tabline = true,
      vim.keymap.set('n', '<space>z', require('simple-zoom').toggle_zoom, { noremap = true, silent = true })
    },
    config = function()
    end
  },
}
