local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.djlint,
  formatting.black.with({
    diagnostics_config = { underline = true, virtual_text = false, signs = false },
  }),
  lint.flake8.with({
    diagnostics_config = { underline = true, virtual_text = false, signs = false, update_in_insert = false, severity_sort = true, },
    -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    extra_args = { "--max-line-length", "88", "--extend-ignore", "E203",},
  }),
  lint.djlint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
