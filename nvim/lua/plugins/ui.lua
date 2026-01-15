-- ============================================
-- UI 插件
-- ============================================

return {
  -- ============================================
  -- 状态栏
  -- ============================================
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { "NvimTree", "lazy" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype", "encoding", "fileformat" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- ============================================
  -- 启动界面
  -- ============================================
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[
       _   _                     _
      | | | |                   | |
   ___| |_| |__   ___ _   _   __| | ___
  / __| __| '_ \ / __| | | | / _` |/ _ \
  \__ \ |_| | | | (__| |_| | (_| |  __/
  |___/\__|_| |_|\___|\__,_|\__,_|\___|
      ]]

      return {
        theme = "doom",
        hide = { statusline = true },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = "FzfLua files", desc = " Find File", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
            { action = "FzfLua live_grep", desc = " Find Text", icon = " ", key = "g" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
        },
      }
    end,
  },

  -- ============================================
  -- 缓冲区标签
  -- ============================================
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = { style = "icon", icon = " " },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "slant",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
      },
    },
  },

  -- ============================================
  -- 通知
  -- ============================================
  {
    "rcarriga/nvim-notify",
    keys = {
      { "<leader>un", ":Telescope notify<CR>", desc = "Notifications" },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
  },

  -- ============================================
  -- 颜色主题 (可选，默认 habamax)
  -- ============================================
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = { style = "night" },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },
}
