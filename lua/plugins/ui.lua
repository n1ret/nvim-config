return {
  {
    "norcalli/nvim-colorizer.lua",
    opts = {}
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        disabled_filetypes = { "dashboard" }
      },
      extensions = { "neo-tree" }
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
  },
  {
    "romgrk/barbar.nvim",
    dependencies = { "lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons" },
    lazy = false,
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = false,

      modified = {button = "●"},

      sidebar_filetypes = {
        ["neo-tree"] = {event = "BufWipeout", text = "Neo-tree"}
      },
    },
    keys = {
      {"<A-.>", "<cmd>BufferNext<cr>", mode={"n", "i"}},
      {"<A-,>", "<cmd>BufferPrevious<cr>", mode={"n", "i"}},
      {"<A-S-.>", "<cmd>BufferMoveNext<cr>", mode={"n", "i"}},
      {"<A-S-,>", "<cmd>BufferMovePrevious<cr>", mode={"n", "i"}},
      {"<A-q>", "<cmd>BufferWipeout<cr>", mode={"n", "i"}}
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    opts = {
      filesystem = {
        hijack_netrw_behavior = "disabled",
        window = { mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none",
          ["<"] = "none",
          [">"] = "none"
        } }
      },
      window = { mappings = {
        ["q"] = {
          function()
            vim.cmd("q")
          end,
          desc = "close tree"
        }
      } }
    },
    keys = {
      {"<leader>t", "<cmd>Neotree reveal<CR>"},
    },
    lazy = false
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "neo-tree",
          "Trouble",
          "lazy",
          "notify",
          "dashboard"
        },
      },
    }
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble"
  },
  {
    "nvimdev/dashboard-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup {
        config = {
          week_header = {
            enable = true
          },
          shortcut = {
            {
              icon = " ",
              desc = "Quit",
              group = "DiagnosticHint",
              action = "qa",
              key = "q"
            }
          },
          disable_move = true,
          footer = {}
        }
      }

      vim.api.nvim_del_augroup_by_name("dashboard")
    end
  }
}
