return {
  {
    "jcdickinson/http.nvim",
    event = "VeryLazy",
    build = "cargo build --workspace --release",
  },
  {
    "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- my personal keymap
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "right", -- | top | left | right
            ratio = 0.4,
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        suggestion = {
          -- what is this for ?
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<c-g>",
            accept_word = "<C-e>",
            accept_line = "<C-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      })
    end,
  },
  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    ft = "gitcommit",
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    -- keys = {
    --   { "<leader>as", desc = "summarize text" },
    --   { "<leader>ag", desc = "generate git message" },
    -- },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("neoai").setup({
        models = {
          {
            name = "openai",
            model = "gpt-4o-mini",
            params = nil,
          },
        },
      })
      -- Create a function to execute the `Git commit` and NeoAI injection
      -- vim.api.nvim_create_user_command('Gc', -- The name of the command
      --   function()
      --     -- Step 1: Open the commit window by running the Git commit command
      --     vim.cmd("Git commit")

      --     vim.notify("filetype:"..vim.bo.filetype)
      --     -- Step 2: Set up an autocommand to run the Lua function when the commit message buffer is loaded
      --     vim.api.nvim_create_autocmd("FileType", {
      --       pattern = "gitcommit", -- Trigger when a git commit message filetype is detected
      --       once = true,           -- Ensure the autocommand runs only once
      --       callback = function()
      --         -- Go to the end of the buffer
      --         vim.cmd("normal! G")
      --         vim.notify("Running NeoAI injection...")
      --         -- Run the specific NeoAI function after the gitcommit buffer is open
      --         require('neoai.shortcuts').shortcut_functions['gitcommitn']()
      --         vim.cmd("normal! G")
      --       end
      --     })
      --   end,
      --   {} -- Additional options (none needed here)
      -- )
    end,
  },
  {
    "luozhiya/fittencode.nvim",
    cmd = { "Fitten" },
    -- event = "InsertEnter",
    config = function()
      require("fittencode").setup({
        use_default_keymaps = false,
        keymaps = {
          inline = {
            ["<C-g>"] = "accept_all_suggestions",
            ["<C-l>"] = "accept_line",
            ["<C-e>"] = "accept_word",
            ["<M-e>"] = "revoke_line",
            ["<M-l"] = "revoke_word",
          },
        },
        vim.api.nvim_set_hl(0, "FittenSuggestion", { fg = "#766FF" }),
        table.insert(require("lualine").sections.lualine_x, {
          function()
            return "FC: "
          end,
          cond = require("fittencode").has_suggestions,
          color = { fg = "#37b0e7", bg = "#101945" },
        }),
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",

    cmd = "CopilotChat",
    dependencies = {
      { "github/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
