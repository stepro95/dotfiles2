local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.filetype.add({
    extension = {
        cds = "cds"
    }
})

-- CDS LSP
-- First we add our custom LSP server to the configs registry
-- We do this such that our client even knows that it exists and that it is possible to set it up
local configs = require("lspconfig.configs")
if not configs.cds then
  configs.cds = {
    default_config = {
      cmd = {
        -- Since we installed cds-lsp globally, we can refer to it using this command
        vim.fn.expand("cds-lsp"),
        -- And then remembering to kindly ask it to be ready for some sweet stdio communication
        "--stdio",
      },
      -- Also remember to tell it which files it actually works with!
      filetypes = { "cds" },
      root_dir = lspconfig.util.root_pattern(".git", "package.json"),
      settings = {},
    },
  }
end
