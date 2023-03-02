-- treesitter and mason lsp servers are added to general.lua

return {
  { "tpope/vim-fireplace" },
  { "tpope/vim-salve" },
  { "guns/vim-clojure-static" },
  { "clojure-vim/vim-jack-in" },
  {
    "eraserhd/parinfer-rust",
    build = "cargo build --release",
  },
}
