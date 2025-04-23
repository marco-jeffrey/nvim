local M = {
  'echasnovski/mini.ai',
  version = false,
  event = 'VeryLazy',
  dependencies = {
    -- {
    --   'echasnovski/mini.extra',
    --   version = false,
    -- },
    {
      "nvim-treesitter/nvim-treesitter-textobjects", version=false
    }
  },
  config = function()
    local gen_spec = require("mini.ai").gen_spec
    require('mini.ai').setup({
      mappings = {
        around = 'a',
        inside = 'i',
      },
      custom_textobjects = {
        F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
        S = gen_spec.treesitter({ a = '@conditional.outer', i = '@conditional.inner' }),
        -- p = gen_spec.treesitter({a = '@assignment.outer', i = '@assignment.outer'}),
      },
    })
  end,
}

return M
