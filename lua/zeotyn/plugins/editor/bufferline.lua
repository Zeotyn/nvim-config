return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        mode = 'buffers',
        diagnostics = "nvim_lsp",     -- | "nvim_lsp" | "coc",
        -- separator_style = "slant", -- | "thick" | "thin" | "slope" | { 'any', 'any' },
        separator_style = { "", "" }, -- | "thick" | "thin" | { 'any', 'any' },
        indicator = {
          -- icon = " ",
          -- style = 'icon',
          style = "underline",
        },
        diagnostics_indicator = function(count, _, _, _)
          if count > 9 then
            return "9+"
          end
          return tostring(count)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Project",
            text_align = "center",
            -- separator = true,
          },
        },
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
        tab_size = 25,
        color_icons = true,
      },
      highlights = {
        buffer_selected = {
          italic = false
        },
        indicator_selected = {
          fg = { attribute = 'fg', highlight = 'Function' },
          italic = false
        }
      }
    })
  end
}
