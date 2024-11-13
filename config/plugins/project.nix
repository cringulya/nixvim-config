{
  keymaps = [{
    mode = "n";
    key = "<leader>p";
    action = "<cmd>Telescope projects<cr>";
    options.desc = "projects";
  }];

  plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
    settings = {
      show_hidden = false;
      detectionMethods = [ "lsp" "pattern" ];
      ignore_lsp = [ "clangd" "nil_ls" ];
      patterns = [
        ".git"
        "build"
        ">polykek"
        ">sandbox"
        ">sonartem"
        ">artemson"
        ">notes"
        "_darcs"
        ".hg"
        ".bzr"
        ".svn"
        ">.config"
        "Makefile"
        "package.json"
        ".stylua.toml"
        "requirements.txt"
        "neovim.json"
        "flake.nix"
      ];
    };
  };
}
