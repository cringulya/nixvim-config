{
  imports = [ ./options.nix ./keymaps.nix ./plugins ];

  colorschemes.oxocarbon.enable = true;

  performance = { byteCompileLua.enable = true; };
}
