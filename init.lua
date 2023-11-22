
vim.g.mkdp_browser = "vivaldi"
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"

-- clipboard
if vim.fn.has("wsl") == 1 then
    if vim.fn.executable("wl-copy") == 0 then
        print("wl-clipboard not found, clipboard integration won't work")
    else
        vim.g.clipboard = {
            name = "wl-clipboard (wsl)",
            copy = {
                ["+"] = 'wl-copy --foreground --type text/plain',
                ["*"] = 'wl-copy --foreground --primary --type text/plain',
            },
            paste = {
                ["+"] = (function()
                    return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', {''}, 1) -- '1' keeps empty lines
                end),
                ["*"] = (function() 
                    return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', {''}, 1)
                end),
            },
            cache_enabled = true
        }
    end
end

-- Code diagnostics
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
