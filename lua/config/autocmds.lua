vim.api.nvim_create_augroup("python_cmd", {clear=true})

local function get_conda_env_info()
  local handle = io.popen("conda info | grep 'active environment'")
  local env_info= handle:read("*a")
  handle:close()
  return env_info
end

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
-- {group="python_cmd",
-- pattern={"*.py"},
-- callback=function(table)
--   local env_info = get_conda_env_info()
--   print(env_info)
-- end}
-- )


