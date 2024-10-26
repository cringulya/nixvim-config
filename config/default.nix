{
  imports = [ ./options.nix ./keymaps.nix ./plugins ./gui.nix ];

  colorschemes.rose-pine.enable = true;

  performance = { byteCompileLua.enable = true; };
}
