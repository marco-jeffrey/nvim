local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim"
  }
}

function M.config()
  local servers = {
      "html",
      "cssls",
      "bashls",
      "jsonls",
      "lua_ls",
      "ts_ls",
      "pyright",
      "denols",
    }

 require("mason").setup({
  ui = { border = "rounded" }
    }
  )

 require("mason-lspconfig").setup({
  ensure_installed = servers
 })
end

return M
