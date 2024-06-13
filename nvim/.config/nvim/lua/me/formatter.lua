require("conform").setup({
  formatters_by_ft = {
    bash = { "shfmt", "shellcheck" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    lua = { "stylua" },
    python = { "black" },
    rust = { "rustfmt" },
    sh = { "shfmt", "shellcheck" },
    zsh = { "shfmt", "shellcheck" },
    ['_'] = { "trim_whitespace" },
  },
})
