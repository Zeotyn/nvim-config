return {
  'mfussenegger/nvim-jdtls',
  filetype = "java",
  keys = {
    { '<leader>rc', ':lua require("jdtls").test_class()<cr>',          desc = 'Run tests in class' },
    { '<leader>rm', ':lua require("jdtls").test_nearest_method()<cr>', desc = 'Run test in nearest method' },
    { '<leader>ct', ':lua require("jdtls.dap").pick_test()<cr>',       desc = 'LSP: Pick test' },
    { '<leader>ci', ':lua require("jdtls").organize_imports()<cr>',    desc = 'LSP: Organize imports' },
    { '<leader>cv', ':lua require("jdtls").extract_variable()<cr>',    desc = 'LSP: Extract variable' },
    { '<leader>cc', ':lua require("jdtls").extract_constant()<cr>',    desc = 'LSP: Extract constant' },
    {
      '<leader>cm',
      ':lua require("jdtls").extract_method(true)<cr>',
      { 'n', 'v', 'x' },
      desc = 'LSP: Extract method'
    },
  }
}
