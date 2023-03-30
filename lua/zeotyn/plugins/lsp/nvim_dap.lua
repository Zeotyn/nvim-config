return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui'
  },
  keys = {
    -- dap
    { '<leader>tp', ':lua require("dap").toggle_breakpoint()<cr>', desc = 'DEBUG: Toggle breakpoint' },
    { '<leader>xc', ':lua require("dap").continue()<cr>',          desc = 'DEBUG: Continue' },
    { '<leader>xo', ':lua require("dap").step_over()<cr>',         desc = 'DEBUG: Step over' },
    { '<leader>xi', ':lua require("dap").step_into()<cr>',         desc = 'DEBUG: Step into' },
    { '<leader>xq', ':lua require("dap").terminate()<cr>',         desc = 'DEBUG: Terminate' },
    { '<leader>xs', ':lua require("dapui").open()<cr>',            desc = 'DEBUG: Open Debug UI' },
    { '<leader>xh', ':lua require("dapui").close()<cr>',           desc = 'DEBUG: Hide Debug UI' },
    { '<leader>tu', ':lua require("dapui").toggle()<cr>',          desc = 'Toggle Debug UI' },
  },
  config = function()
    require("nvim-dap-virtual-text").setup()
    require('dapui').setup()
  end
}
