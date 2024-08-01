local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.brief = {
  install_info = {
    url = '~/.config/nvim/lua/kda/tree-sitter-brief', -- local path or git repo
    files = { 'src/parser.c' }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    -- branch = "main",                  -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = 'brief', -- if filetype does not match the parser name
}

local nvim_lsp = require 'lspconfig'
local configs = require 'lspconfig.configs'
local util = require 'lspconfig.util'

-- Inject Brief LSP
if not configs.briefls then
  configs.briefls = {
    default_config = {
      cmd = { 'briefls' },
      filetypes = { 'brief' },
      root_dir = function(fname)
        return util.root_pattern '.git'(fname)
      end,
      single_file_support = true,
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
    },
    settings = {},
  }
end

-- Setup server
nvim_lsp.briefls.setup {
  on_attach = lsp_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
}
