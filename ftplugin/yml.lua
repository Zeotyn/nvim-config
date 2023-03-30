require('lsp-zero').yamlls.setup({
  settings = {
    yaml = {
      schemas = { kubernetes = "globPattern" },
    }
  }
})

