return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      go = { "golangcilint" },
    }
    -- golangci-lint v2 refuses parallel runs and errors with exit code 3
    -- ("parallel golangci-lint is running"); make concurrent runs wait instead.
    table.insert(lint.linters.golangcilint.args, 2, "--allow-serial-runners")
    -- Fix standalone-file linting on Windows: nvim-lint detects "no module" via
    -- `go env GOMOD == '/dev/null'`, but Windows returns "NUL", so it lints the
    -- directory instead of the file and golangci-lint exits with code 5
    -- ("no go files to analyze"). Replace the path argument with one that
    -- detects the module correctly at lint time.
    local args = lint.linters.golangcilint.args
    args[#args] = function()
      local bufname = vim.api.nvim_buf_get_name(0)
      local dir = vim.fn.fnamemodify(bufname, ":h")
      if vim.fs.root(dir, "go.mod") then
        return dir -- inside a module: lint the package directory
      end
      return vim.fn.fnamemodify(bufname, ":p") -- standalone file: lint it directly
    end
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
