local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.djlint,
  formatting.black,
  lint.flake8.with({
    diagnostics_config = { underline = false, virtual_text = false, signs = false },
    method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
  }),
  lint.djlint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
