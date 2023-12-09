require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  layouts = {
    {
      elements = {
        { id = "watches", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "scopes", size = 0.25 },
      },
      position = "left",
      size = 40
    },
    {
      elements = {
        { id = "console", size = 0.5 },
        { id = "repl", size = 0.5 },
      },
      position = "bottom",
      size = 10
    }
  },
  floating = {
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  render = {
    indent = 1
  },
})
