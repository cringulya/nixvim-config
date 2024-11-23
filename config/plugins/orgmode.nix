{
  plugins.orgmode = {
    enable = true;
    settings = {
      org_agenda_files = "~/org/**/*";
      org_default_notes_file = "~/org/refile.org";
    };
  };

  autoCmd = [{
    event = [ "FileType" ];
    pattern = [ "org" ];
    callback.__raw = ''
      function()
        vim.opt_local.concealcursor = "nc"
        -- vim.opt_local.wrap = false
        vim.opt_local.cc = "0"
      end
    '';
  }];
}
