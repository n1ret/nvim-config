return {
  {
    "norcalli/nvim-colorizer.lua",
    opts = {}
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      extensions = { "neo-tree" }
    }
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    }
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

      modified = {button = '●'},

      sidebar_filetypes = {
        ['neo-tree'] = {event = "BufWipeout", text = "Neo-tree"}
      },
    },
    keys = {
      {"<A-.>", "<cmd>BufferNext<cr>", mode={"n", "i"}},
      {"<A-,>", "<cmd>BufferPrevious<cr>", mode={"n", "i"}},
      {"<A-S-.>", "<cmd>BufferMoveNext<cr>", mode={"n", "i"}},
      {"<A-S-,>", "<cmd>BufferMovePrevious<cr>", mode={"n", "i"}},
      {"<A-q>", "<cmd>BufferClose<cr>", mode={"n", "i"}}
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
        hijack_netrw_behavior = "open_current",
        window = { mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["<space>"] = "none"
        }
      }}
    },
    keys = {
      {"<leader>t", "<cmd>Neotree toggle<CR>"},
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
        },
      },
    }
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble"
  }
}
