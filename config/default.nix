{
  imports = [ ./options.nix ./keymaps.nix ./plugins ./gui.nix ];

  colorschemes.kanagawa.enable = true;

  performance = { byteCompileLua.enable = true; };
}
