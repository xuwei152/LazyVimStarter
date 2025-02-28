return {
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require('leap').add_default_mappings()
      local function get_line_starts_up(winid, skip_range)
        local wininfo = vim.fn.getwininfo(winid)[1]
        local cur_line = vim.fn.line('.')
        -- Skip lines close to the cursor.
        skip_range = skip_range or 2

        -- Get targets.
        local targets = {}
        local lnum = wininfo.topline
        while lnum <= wininfo.botline do
          local fold_end = vim.fn.foldclosedend(lnum)
          -- Skip folded ranges.
          if fold_end ~= -1 then
            lnum = fold_end + 1
          else
            if (lnum < cur_line + skip_range) then -- move down
              -- if (lnum < cur_line - skip_range) or (lnum > cur_line + skip_range) then
              table.insert(targets, { pos = { lnum, 1 } })
            end
            lnum = lnum + 1
          end
        end

        -- Sort them by vertical screen distance from cursor.
        local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
        local function screen_rows_from_cur(t)
          local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
          return math.abs(cur_screen_row - t_screen_row)
        end
        table.sort(targets, function(t1, t2)
          return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
        end)

        if #targets >= 1 then
          return targets
        end
      end

      local function get_line_starts_down(winid, skip_range)
        local wininfo = vim.fn.getwininfo(winid)[1]
        local cur_line = vim.fn.line('.')
        -- Skip lines close to the cursor.
        skip_range = skip_range or 2

        -- Get targets.
        local targets = {}
        local lnum = wininfo.topline
        while lnum <= wininfo.botline do
          local fold_end = vim.fn.foldclosedend(lnum)
          -- Skip folded ranges.
          if fold_end ~= -1 then
            lnum = fold_end + 1
          else
            if (lnum > cur_line + skip_range) then -- move down
              -- if (lnum < cur_line - skip_range) or (lnum > cur_line + skip_range) then
              table.insert(targets, { pos = { lnum, 1 } })
            end
            lnum = lnum + 1
          end
        end

        -- Sort them by vertical screen distance from cursor.
        local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
        local function screen_rows_from_cur(t)
          local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
          return math.abs(cur_screen_row - t_screen_row)
        end
        table.sort(targets, function(t1, t2)
          return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
        end)

        if #targets >= 1 then
          return targets
        end
      end

      -- You can pass an argument to specify a range to be skipped
      -- before/after the cursor (default is +/-2).
      ---@diagnostic disable-next-line: lowercase-global
      function leap_linewise_down(skip_range)
        local winid = vim.api.nvim_get_current_win()
        require('leap').leap {
          target_windows = { winid },
          targets = get_line_starts_down(winid, skip_range),
        }
      end

      ---@diagnostic disable-next-line: lowercase-global
      function leap_linewise_up(skip_range)
        local winid = vim.api.nvim_get_current_win()
        require('leap').leap {
          target_windows = { winid },
          targets = get_line_starts_up(winid, skip_range),
        }
      end

      -- vim.keymap.set('n', 'L', "<cmd>lua leap_linewise_down()<cr>")
      -- vim.keymap.set('n', 'LL', "<cmd>lua leap_linewise_up()<cr>")
    end
  },
  {
    "rainzm/flash-zh.nvim",
    event = "VeryLazy",
    dependencies = "folke/flash.nvim",
    keys = { {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash-zh").jump({
          chinese_only = false
        })
      end,
      desc = "Flash between Chinese"
    } }
  },
  {
    'smoka7/hop.nvim',
    cmd = "HopChar1",
    branch = 'master', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup {
        keys = 'fjghdkslatuyirewpnvbcmxz;FJGHDLATUYIREQNB,q',
        extensions = {
          'hop-zh-by-flypy',
        },
      }
      vim.keymap.set('n', 'F', '<cmd>HopChar1CurrentLine<CR>')
      vim.keymap.set('n', 'f', function()
        -- 
        require 'hop'.hint_char1() 
      end, { silent = true })
      vim.keymap.set('n', 'Ld',
        function()
          require 'hop'.hint_lines({
            direction = require('hop.hint').HintDirection.AFTER_CURSOR
          })
        end)
      vim.keymap.set('n', 'L',
        function()
          require 'hop'.hint_lines({
            direction = require('hop.hint').HintDirection.AFTER_CURSOR
          })
        end)
      vim.keymap.set('n', 'LL', '<Cmd>HopLineStartBC<CR>')
      vim.keymap.set('v', 'LL', '<Cmd>HopLineStartBC<CR>')
      vim.keymap.set('v', 'f', '<cmd>HopChar1<CR>')
    end
  },
  {
    'zzhirong/hop-zh-by-flypy',
    dependencies = {
      'smoka7/hop.nvim',
    },
    config = function()
      local hop_flypy = require "hop-zh-by-flypy"
      hop_flypy.setup({
        -- 注意: 本扩展的默认映射覆盖掉了一些常用的映射: f, F, t, T, s
        -- 设置 set_default_mappings 为 false 可关闭默认映射.
        set_default_mappings = false,
      })
      -- vim.keymap.set('n', 'f', '<cmd>HopFlypy1<CR>')
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.api.nvim_create_user_command('FunNextStart', 'TSTextobjectGotoNextStart @function.outer', {})
      vim.api.nvim_create_user_command('FunPrevStart', 'TSTextobjectGotoPreviousStart @function.outer', {})
      vim.api.nvim_create_user_command('FunNextEnd', 'TSTextobjectGotoNextEnd @function.outer', {})
      vim.api.nvim_create_user_command('FunPrevEnd', 'TSTextobjectGotoPreviousEnd @function.outer', {})

      vim.api.nvim_create_user_command('ClassNextStart', 'TSTextobjectGotoNextStart @class.outer', {})
      vim.api.nvim_create_user_command('ClassPrevStart', 'TSTextobjectGotoPreviousStart @class.outer', {})
      vim.api.nvim_create_user_command('ClassNextEnd', 'TSTextobjectGotoNextEnd @class.outer', {})
      vim.api.nvim_create_user_command('ClassPrevEnd', 'TSTextobjectGotoPreviousEnd @class.outer', {})
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              -- ["]]"] = { query = "@class.outer", desc = "Next class start" },
              --
              -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
              ["]o"] = "@loop.*",
              -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
              --
              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
              ["]]"] = "@block.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@block.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
              ["]d"] = "@conditional.outer",
            },
            goto_previous = {
              ["[d"] = "@conditional.outer",
            }
          },
          select = {
            enable = true,
            keymaps = {
              -- Your custom capture.
              ["aF"] = "@custom_capture",

              -- Built-in captures.
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
        },
      }
    end
  },
  {
    "tris203/precognition.nvim",
    opts = { showBlankVirtLine = false }
  },
}
