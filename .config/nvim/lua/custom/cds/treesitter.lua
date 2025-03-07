-- CDS Custom Parser
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.cds = {
  install_info = {
    -- local path or git repo
    -- (I prefer the git repo way such that I can easily swap machines but keep the config)
    url = "https://github.com/cap-js-community/tree-sitter-cds.git",
    branch = "main",
    -- Small note here, treesitters documentation doesn't tell you this but you actually
    -- need both the parser.c and the scanner.c files included here, otherwise it won't compile!
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "cds", -- if filetype does not match the parser name
}

-- Set the commentstring for cds
vim.cmd [[
  au FileType cds setlocal commentstring=//%s
]]
