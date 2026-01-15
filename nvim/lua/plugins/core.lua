-- ============================================
-- 核心插件
-- ============================================

return {
  -- ============================================
  -- Treesitter - 语法高亮
  -- ============================================
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "typescript",
        "python",
        "go",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "gitignore",
      },
    },
  },

  -- ============================================
  -- FZF - 模糊查找 (使用你已有的 fzf)
  -- ============================================
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "FzfLua" },
    keys = {
      { "<leader>ff", ":FzfLua files<CR>", silent = true },
      { "<leader>fg", ":FzfLua live_grep<CR>", silent = true },
      { "<leader>fb", ":FzfLua buffers<CR>", silent = true },
      { "<leader>fh", ":FzfLua helptags<CR>", silent = true },
      { "<leader>fc", ":FzfLua commands<CR>", silent = true },
    },
    opts = {
      file_icon_padding = "",
    },
  },

  -- ============================================
  -- Git 集成
  -- ============================================
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
    },
  },

  -- ============================================
  -- 自动配对
  -- ============================================
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- ============================================
  -- 自动注释
  -- ============================================
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle" },
      { "gc", mode = { "n", "v" }, desc = "Comment linewise" },
    },
    opts = {
      toggler = { line = "gcc" },
      opleader = { line = "gc" },
    },
  },

  -- ============================================
  -- 缩进线
  -- ============================================
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = false },
    },
  },

  -- ============================================
  -- 终端
  -- ============================================
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = { "<leader>tt" },
    opts = {
      open_mapping = [[<leader>tt]],
      direction = "float",
      float_opts = { border = "rounded" },
    },
  },
}
