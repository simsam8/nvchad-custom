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
     dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function ()
        require "custom.configs.null-ls"
      end,
    },
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
        "flake8",
        "black",
        "djlint",
        "bash-language-server",
        "marksman",
        "clangd",
      }
    }
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- opts = {},
  },

  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install; yarn add tslib", init = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
  {
    "christoomey/vim-tmux-navigator",
    lazy=false,
  },

}

return plugins

