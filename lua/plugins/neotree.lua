return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
      window = {
        mappings = {
          -- toggle preview
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },

          -- use space to open
          ["<cr>"] = { "toggle_node" },
          ["<space>"] = { "open" },
        },
      },
      event_handlers = {

        -- close tree on file opening
        {
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },

        -- hide cursor
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd("highlight! Cursor blend=100")
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
          end,
        },
      },
    })
  end,
}
