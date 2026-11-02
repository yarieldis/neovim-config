return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
      -- Install parsers asynchronously (no-op if already installed).
      -- Highlighting is enabled automatically by Neovim for installed parsers.
      require("nvim-treesitter").install { "go", "lua", "vim", "vimdoc" }
    end
  }
}
