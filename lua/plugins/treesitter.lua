return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      -- nvim-treesitter compiles parsers with the `cc` crate, which defaults to
      -- MSVC on Windows. If gcc (MinGW) is available but MSVC is not, point it
      -- at gcc so parser builds succeed.
      if vim.fn.has("win32") == 1 and vim.fn.executable("gcc") == 1 and vim.fn.executable("cl") == 0 then
        vim.env.CC = "gcc"
      end

      -- Install parsers asynchronously (no-op if already installed).
      -- Highlighting is enabled automatically by Neovim for installed parsers.
      require("nvim-treesitter").install { "go", "lua", "vim", "vimdoc" }
    end
  }
}
