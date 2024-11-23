{ pkgs, ... }:

{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "org-bullets";
      src = pkgs.fetchFromGitHub {
        owner = "nvim-orgmode";
        repo = "org-bullets.nvim";
        rev = "46ae687e22192fb806b5977d664ec98af9cf74f6";
        hash = "sha256-cRcO0TDY0v9c/H5vQ1v96WiEkIhJDZkPcw+P58XNL9w=";
      };
    })
  ];

  plugins.orgmode = {
    enable = true;
    settings = {
      org_agenda_files = "~/org/**/*";
      org_default_notes_file = "~/org/refile.org";
    };
    luaConfig.pre =
      #lua
      ''
        require('org-bullets').setup()
        require('orgmode').setup({
            settings = {
              org_agenda_files = "~/org/**/*",
              org_default_notes_file = "~/org/refile.org",
            },
            mappings = {
                prefix = '<leader>n'
            },
        })
      '';
  };

  autoCmd = [{
    event = [ "FileType" ];
    pattern = [ "org" ];
    callback.__raw = ''
      function() vim.opt_local.concealcursor = "nc" -- vim.opt_local.wrap = false
        vim.opt.concealcursor = 'nc' vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', { silent = true,
            buffer = true, }) end '';
  }];
}
