return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      local function setup_server(server_name, opts)
        lspconfig[server_name].setup(
          vim.tbl_extend("force", opts, { capabilities = lsp_capabilities })
        )
      end

      -- Lua LSP
      setup_server("lua_ls", {})

      -- Rust-analyzer
      setup_server("rust_analyzer", {
        settings = {
          ['rust-analyzer'] = {},
        },
      })

      -- Ruff linter
      setup_server("ruff_lsp", {
        init_options = {
          settings = {
            args = {
              "--select=E,F,UP,N,I,ASYNC,S,PTH",
              "--line-length=79",
              "--respect-gitignore",  -- Exclude files mathing .gitignore
            },
          }
        }
      })
    end,
    keys = {
      { "<leader>e", vim.diagnostic.open_float },
    },
    lazy = false,
    enabled = false
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  }
}
