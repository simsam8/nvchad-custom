-- Diagnostic settings
-- 
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = {
      severity_limit = "Hint",
    },
    virtual_text = {
      severity_limit = "Warning",
    },
  }
)

-- Curlyline highlight
-- vim.cmd.highlight("DiagnosticUnderlineError guisp=#ff0000 gui=undercurl")


-- Keybindings
--
vim.keymap.set("i", "jk", "<ESC>", {silent = true})
vim.keymap.set("n", "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
