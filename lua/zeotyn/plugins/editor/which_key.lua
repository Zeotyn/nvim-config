return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup({})

    local keymaps = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gz"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>h"] = { name = "+hunks" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>t"] = { name = "+toggle" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
      ["<leader>r"] = { name = "+run" },
      ["<leader>w"] = { name = "+workspace" },
      ["<leader>s"] = { name = "+spectre" },
      ["<leader>e"] = { name = "+errors" },
    }

    wk.register(keymaps)
  end,
}
