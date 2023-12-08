require("flutter-tools").setup {
  debugger = {
    enabled = true,
    register_configurations =function(_)
      require("dap").configurations.flutter = {}
    end,
  }
}

