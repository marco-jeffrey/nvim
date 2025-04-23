local M = {
  "akinsho/toggleterm.nvim",
  config = true,
  cmd = "ToggleTerm",
  build = ":ToggleTerm",
  keys = { { "<c-\\>", "<cmd>ToggleTerm<cr>", desc = "toggle floating terminal" } },
  opts = {
    cmd = "conda activate torch",
    open_mapping = [[<c-\>]],
    direction = "float",
    shade_filetypes = {},
    hide_numbers = true,
    insert_mappings = true,
    terminal_mappings = true,
    start_in_insert = true,
    close_on_exit = true,
  },
}

return M
