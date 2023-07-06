-- In order to modify the `lspconfig` configuration:
local plugins = {
{
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults 
        "vim",
        "lua",

        -- 
        "markdown_inline",
        "python",

        -- web dev 
        "html",
        "htmldjango",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

       -- low level
        "c",
        "cpp",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "pyright",
        "pylint",
        "djlint",
        "bash-language-server",
        "marksman",
        "clangd",
      }
    }
  }

}

return plugins

