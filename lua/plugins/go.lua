return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  build = ':lua require("go.install").update_all_sync()',
  config = function()
    require("go").setup({
      gofmt = "gofumpt",      -- or "gofmt" / "goimports"
      goimport = "goimports", -- organize imports on save
    })
  end,
}
