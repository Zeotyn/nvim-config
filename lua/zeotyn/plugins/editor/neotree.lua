return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  keys = {
    { '<leader>ft', '<cmd>Neotree toggle<cr>', desc = 'Toggle neotree' },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      -- only needed if you want to use the commands with "_with_window_picker" suffix
      's1n7ax/nvim-window-picker',
      version = "*",
      config = function()
        require 'window-picker'.setup({
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', "quickfix" },
            },
          },
          other_win_hl_color = '#e35e4f',
        })
      end,
    }
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignError",
      { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn",
      { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo",
      { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint",
      { text = "", texthl = "DiagnosticSignHint" })

    require('neo-tree').setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      sources = {
        "filesystem",
        "git_status",
        "diagnostics",
      },
      source_selector = {
        winbar = true,
        statusline = false, -- toggle to show selector on statusline
        content_layout = "center",
        tabs_layout = "equal",
        tab_labels = {
          filesystem = "  ",
          git_status = "  ",
          diagnostics = " 裂",
        },
      },
      default_component_config = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = " ",
          highlight = "NeoTreeFileIcon",
        },
        buffers = {
          follow_current_file = true, -- This will find and focus the file in the active buffer every
          -- time the current file is changed while the tree is open.
          group_empty_dirs = true,    -- when true, empty folders will be grouped together
          show_unloaded = true,
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false
          },
          follow_current_file = true,
          group_empty_dirs = true,
          use_libuv_file_watcher = true,
          hijack_netrw_behavior = "open_default",
        },
        indent = {
          indent_size = 2,
          padding = 0, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└", -- └
          -- indent_marker = "▏",
          -- last_indent_marker = "▏",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = false, -- if nil and file nesting is enabled, will enable expanders
          -- expander_collapsed = "",
          -- expander_expanded = "",

          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        diagnostics = {
          highlights = {
            hint = "DiagnosticSignHint",
            info = "DiagnosticSignInfo",
            warn = "DiagnosticSignWarn",
            error = "DiagnosticSignError",
          },
        },
      }
    })
  end
}
