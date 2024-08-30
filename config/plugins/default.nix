{
  imports = [
    ./lsp/servers.nix
    ./lsp/none-ls.nix
    ./lsp/trouble.nix
    ./autopairs.nix
    ./cmp.nix
    ./git.nix
    ./lualine.nix
    ./matchup.nix
    ./navic.nix
    ./noice.nix
    ./nvim-tree.nix
    ./project.nix
    ./telescope.nix
    ./treesitter.nix
    ./wilder.nix
  ];

  plugins = {
    tmux-navigator.enable = true;
    surround.enable = true;
    neoscroll.enable = true;
    neogit.enable = true;
  };
}
