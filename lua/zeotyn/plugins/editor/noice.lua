return {
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
      -- add any options here
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
          ["vim.lsp.handlers.signature_help.enabled"] = false
        },
        cmdline_popup = {
          border = {
            style = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█", "1" }, -- [ top top top - right - bottom bottom bottom - left ]
            style = "",
            padding = { 0, 0 },
          },
          filter_options = {},
        },
      },
    })
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
}
