return {
  {
    "folke/noice.nvim",
    -- event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    opts = {
      commands = {
        errors = {
          view = "split",
        },
      },
      routes = {
        {
          filter = {
            event = "Codeium completion request failed",
            find = "No lines"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "No lines"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "failed to run generator"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "No client"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "No client"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "position_encoding"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "crashed"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "codeium/codeium"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "Hop"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "Defining diagnostic signs with"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "written$"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "Too many spell bad words."
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "lines yanked"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "more lines"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "CursorMoved Autocommands"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "fewer lines"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "attempt to concatenate a nil value"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "nvim_exec2"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "redraw"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "now deprecated"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "is deprecated"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "line less"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "more line"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "change"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "dead coroutine"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "assertion failed"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "There were issues reported with your"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "There are issues with your config"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "multiple different client offset_encodings detected for buffer"
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "Error executing vim.schedule lua callback"
          },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
        long_message_to_split = true, -- long messages will be sent to a split
      }
    },
  },

}
