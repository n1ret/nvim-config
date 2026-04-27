return {
  {
    "neovim/nvim-lspconfig",
    opts = {
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
