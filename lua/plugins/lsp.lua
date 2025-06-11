return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable({"lua_ls"})
    end,
    lazy = false
  },
  {
    "folke/lazydev.nvim",
    enabled = false,
    ft = "lua",
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    build = function()
      vim.cmd.MasonUpdate()

      vim.cmd.MasonInstall("lua-language-server")
    end,
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
