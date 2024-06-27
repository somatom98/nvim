return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = true,
        severity_sort = true,
      },
      inlay_hints = { enabled = false },
    },
  },
}
