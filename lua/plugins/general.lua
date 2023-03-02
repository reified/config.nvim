return {

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "gruvbox",
    },
  },

  -- reconfugire telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
    },
    keys = {
      -- add keymap to browse plugin files
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.stdpath("config") .. "/lua",
          })
        end,
        desc = "Find Plugin Files",
      },
    },
  },

  { "tpope/vim-sexp-mappings-for-regular-people" },
  { "guns/vim-sexp" },
  { "tpope/vim-repeat" },
  { "tpope/vim-projectionist" },
  { "tpope/vim-dispatch" },
}
