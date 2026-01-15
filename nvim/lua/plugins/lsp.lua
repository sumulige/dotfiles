-- ============================================
-- LSP 和补全
-- ============================================

return {
  -- ============================================
  -- LSP 配置 (Neovim 0.11+ API)
  -- ============================================
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },  -- Lua LSP 增强
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      -- 通用 LSP on_attach
      local on_attach = function(_, bufnr)
        local nnoremap = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        nnoremap("gd", vim.lsp.buf.declaration, "Go to declaration")
        nnoremap("gD", vim.lsp.buf.definition, "Go to definition")
        nnoremap("K", vim.lsp.buf.hover, "Hover documentation")
        nnoremap("gi", vim.lsp.buf.implementation, "Go to implementation")
        nnoremap("<leader>sh", vim.lsp.buf.signature_help, "Signature help")
        nnoremap("<leader>rn", vim.lsp.buf.rename, "Rename")
        nnoremap("<leader>ca", vim.lsp.buf.code_action, "Code action")
        nnoremap("gr", vim.lsp.buf.references, "References")
      end

      -- 通用 capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- LSP 服务器配置 (使用 Neovim 0.11+ 新 API)
      local lspconfig = require("lspconfig")

      local servers = {
        gopls = {},
        pyright = {},
        ts_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        nil_ls = {},  -- Nix LSP
        rust_analyzer = {},
        clangd = {},
      }

      for server, opts in pairs(servers) do
        opts.on_attach = on_attach
        opts.capabilities = capabilities
        lspconfig[server].setup(opts)
      end
    end,
  },

  -- ============================================
  -- 补全框架
  -- ============================================
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer", keyword_length = 3 },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = {
              Text = "󰉿",
              Method = "󰆧",
              Function = "󰊕",
              Constructor = "󰒓",
              Field = "󰜢",
              Variable = "󰀫",
              Class = "󰠱",
              Interface = "󰜰",
              Module = "󰏗",
              Property = "󰜢",
              Unit = "󰑭",
              Value = "󰎠",
              Enum = "󰕻",
              Keyword = "󰌋",
              Snippet = "󰃃",
              Color = "󰏘",
              File = "󰈔",
              Reference = "󰈇",
              Folder = "󰉋",
              EnumMember = "󰕻",
              Constant = "󰏿",
              Struct = "󰙅",
              Event = "󰃅",
              Operator = "󰆕",
              TypeParameter = "󰅲",
            }
            item.kind = (icons[item.kind] or "") .. " " .. item.kind
            return item
          end,
        },
      })
    end,
  },
}
