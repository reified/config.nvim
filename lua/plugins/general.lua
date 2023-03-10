return {

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "gruvbox",
    },
  },

  -- change the logo at dashboard
  -- TODO:: is there a better way?
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
      ██████╗░███████╗██╗███████╗██╗███████╗██████╗░
      ██╔══██╗██╔════╝██║██╔════╝██║██╔════╝██╔══██╗
      ██████╔╝█████╗░░██║█████╗░░██║█████╗░░██║░░██║
      ██╔══██╗██╔══╝░░██║██╔══╝░░██║██╔══╝░░██║░░██║
      ██║░░██║███████╗██║██║░░░░░██║███████╗██████╔╝
      ╚═╝░░╚═╝╚══════╝╚═╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button(
          "c",
          " " .. " Config",
          [[:lua require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") .. "/lua" }) <cr>]]
        ),
        dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
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
