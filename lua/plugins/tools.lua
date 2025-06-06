return {
  {
    "folke/which-key.nvim"
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },
  {
    "lambdalisue/vim-suda",
    config=function()
      vim.api.nvim_create_user_command(
        "W", function()
          vim.cmd.SudaWrite()
        end, {}
      )
      vim.api.nvim_create_user_command(
        "Wq", function()
          vim.cmd.SudaWrite()
          vim.cmd.quit()
        end, {}
      )
    end
  }
}
