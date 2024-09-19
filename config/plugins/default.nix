{ pkgs, ... }:

{
  imports = [
    ./lsp/options.nix
    ./lsp/servers.nix
    ./lsp/none-ls.nix
    ./lsp/trouble.nix
    ./autopairs.nix
    ./cmp.nix
    ./code_runner.nix
    ./dashboard.nix
    ./dressing.nix
    ./git.nix
    ./lualine.nix
    ./matchup.nix
    ./navic.nix
    ./neogit.nix
    ./neorg.nix
    ./noice.nix
    ./notify.nix
    ./nvim-tree.nix
    ./project.nix
    ./tabout.nix
    ./telescope.nix
    ./treesitter.nix
    ./vimtex.nix
    ./which-key.nix
  ];

  plugins = {
    tmux-navigator.enable = true;
    vim-surround.enable = true;
    neoscroll = {
      enable = true;
      settings.hide_cursor = false;
    };
    notify.enable = true;
    nvim-colorizer.enable = true;
    neoclip.enable = true;
    comment = {
      enable = true;
      settings.pre_hook =
        "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
    };
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "cyrillic";
      src = pkgs.fetchFromGitHub {
        owner = "nativerv";
        repo = "cyrillic.nvim";
        rev = "86186af29eed2af1a069f9e36140d116a2765c80";
        hash = "sha256-B2NjvaKJbkih8HLgFAYVqmTuSKAj7XrCBPVoVpYCXXE=";
      };
    })
  ];
  extraConfigLua = ''
    require('cyrillic').setup({
      no_cyrillic_abbrev = false, -- default
    })
  '';
}
