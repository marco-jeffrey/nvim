local M = {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' , {"nvim-telescope/telescope-fzf-native.nvim", build="make"}
      },
      defaults = {
      file_ignore_patterns = {
        "%.min.js$",    -- excludes .min.js files
        "node_modules/", -- excludes node_modules directory
        "%.git/",       -- excludes .git directory
        "%.pixi/",       -- excludes .git directory
        "dist/",        -- excludes dist directory
        "build/",       -- excludes build directory
        }
      }
}

function M.config()
  local builtin = require("telescope.builtin")
  local set = vim.keymap.set

  set("n", "<Leader>ff", builtin.find_files, {desc="[f]ind [f]iles"})
  set("n", "<Leader>fg", builtin.live_grep, {desc="[[gr]ep [a]ll files"})
  set("n", "<Leader>sb", builtin.current_buffer_fuzzy_find, {desc="[s]earch [b]uffer"})
  -- set("n", "<Leader>fgo", builtin.live_grep, {desc="[[gr]ep [o]pen files"})
  -- set("n", "<Leader>sb", builtin.live_grep({grep_open_files=true}))
  set("n", "<Leader>cf", function()
    builtin.find_files({cwd = vim.fn.stdpath("config")})
  end
  , {desc="[s]earch neovim [c]onfig"})
  set("n", "<Leader>cg", function()
    builtin.live_grep({cwd = vim.fn.stdpath("config"), glob_pattern="**/*.lua"})
  end
  , {desc="[g]rep neovim [c]onfig"})

  set("n", "<Leader>fr", builtin.lsp_document_symbols, {desc="[f]ind [r]eferences"})
  set("n", "<Leader>fd", builtin.lsp_definitions, {desc="[f]ind [d]efinitions"})
  

end

return M
