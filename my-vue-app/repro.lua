vim.env.LAZY_STDPATH = ".repro"
load(
  vim.fn.system(
    "curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"
  )
)()

---@diagnostic disable-next-line: missing-fields
require("lazy.minit").repro({
  spec = {
    {
      "saghen/blink.cmp",
      -- please test on `main` if possible
      -- otherwise, remove this line and set `version = '*'`
      -- build = "cargo build --release",
      version = "*",
      opts = {
        keymap = { preset = "default" },
        appearance = {
          nerd_font_variant = "mono",
        },
        completion = {
          documentation = { auto_show = false },
          accept = {
            auto_brackets = {
              kind_resolution = {
                blocked_filetypes = {
                  "typescriptreact",
                  "javascriptreact",
                },
              },
            },
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "lua" },
      },
      opts_extend = { "sources.default" },
    },
    {
      "mason-org/mason.nvim",
      build = ":MasonUpdate",
      opts = {},
    },
    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
      opts = {
        ensure_installed = { "lua_ls", "ts_ls" },
      },
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
    },
  },
})
