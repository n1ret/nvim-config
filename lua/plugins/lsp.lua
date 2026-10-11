return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false
      },
      servers = {
        ["*"] = {
          keys = {
            { "<leader>cD", "<cmd>lsp restart<cr>", desc = "Lsp Restart" },
          },
        },
      },
    },
  },
}
