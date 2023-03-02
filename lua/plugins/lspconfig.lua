return {
  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "clojure",
        "dockerfile",
        "git_rebase",
        "gitignore",
        "go",
        "http",
        "html",
        "java",
        "json",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "rst",
        "ruby",
        "rust",
        "vim",
        "yaml",
      },
    },
  },

  -- Automated installation of mainstream language servers
  -- We still have to install ccls separately, as it is not
  -- provided (yet).
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clojure-lsp",
        "dockerfile-language-server",
        "jdtls",
        "kotlin-language-server",
        "rubocop",
        "rust-analyzer",
        "ruby-lsp",
        "stylua",
        "shellcheck",
        "shfmt",
      },
    },
  },

  -- A tree like view for symbols in Neovim using the LSP.
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "View Symvbols Outline" },
    },
    config = true,
  },

  -- Primary LSP confiurations via nvim-lspconfig.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jackguo380/vim-lsp-cxx-highlight",
    },
    opts = {
      servers = {
        ccls = {
          -- We must use ccls for formatting C/C++ buffers. As null-ls
          -- is not compatible with ccls.

          capabilities = vim.lsp.protocol.make_client_capabilities(),

          init_options = {
            highlight = {
              lsRanges = true,
            },
          },
        },
      },
    },
  },
}
