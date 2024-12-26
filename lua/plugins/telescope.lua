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
  set("n", "<Leader>sc", function()
    builtin.find_files({cwd = vim.fn.stdpath("config")})
  end
  , {desc="[s]earch neovim [c]onfig"})
  set("n", "<Leader>gr", builtin.live_grep, {desc="[[gr]ep files"})
  -- set("n", "<Leader>sb", builtin.live_grep({grep_open_files=true}))
  set("n", "<Leader>gc", function()
    builtin.live_grep({cwd = vim.fn.stdpath("config"), glob_pattern="**/*.lua"})
  end
  , {desc="[g]rep neovim [c]onfig"})

end

return M
