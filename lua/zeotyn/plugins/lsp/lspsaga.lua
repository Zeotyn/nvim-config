return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  keys = {
    { "<leader>lo", "<cmd>Lspsaga outline<cr>", desc = "Show outline" }
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" }
  },
  config = function()
    require("lspsaga").setup({})
  end,
}
