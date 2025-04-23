local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
   }
  }
}

local function lsp_keymaps(bufnr)
  local opts = {noremap = true, silent = true }
  local set = vim.api.nvim_buf_set_keymap
  set(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  set(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references(nil)<cr>", opts)
end


M.on_attach = function(client , bufnr)
  lsp_keymaps(bufnr)
end

-- add snippet support, so that if ls has that it can return snippets
function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

local function get_python_path()
  local handle = io.popen("which python")
  local python_path = handle:read("*a"):gsub("%s+", "") -- Remove any whitespace
  handle:close()
  return python_path
end



-- setup languages
function M.config()
  lspconf = require("lspconfig")
  lspconf.lua_ls.setup({
    on_attach = M.on_attach,
    capabilities = M.common_capabilities()
  })
  
  lspconf.pyright.setup({
    settings = {
      python = {
        pythonPath = get_python_path(),
      },
    },
    on_attach = M.on_attach,
    capabilities = M.common_capabilities()
  })
  
  lspconf.ts_ls.setup({
    on_attach = M.on_attach,
    capabilities = M.common_capabilities(),
    root_dir = lspconf.util.root_pattern("package.json"),
    single_file_support = false
  })

  lspconf.tailwindcss.setup({
    on_attach = M.on_attach,
    capabilities = M.common_capabilities(),
  })

  lspconf.denols.setup {
  on_attach = M.on_attach,
  capabilities = M.common_capabilities(),
  root_dir = lspconf.util.root_pattern("deno.json", "deno.jsonc"),
}
end

return M
