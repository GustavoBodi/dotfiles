local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/path/to/omnisharp-repo/run"
-- on Windows
-- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"

local config = {
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  cmd = { omnisharp_bin, '--languageserver' , '--hostPID', tostring(pid) },
  -- rest of your settings
}
require'lspconfig'.omnisharp.setup(config)
require('omnisharp_extended').telescope_lsp_definitions()
