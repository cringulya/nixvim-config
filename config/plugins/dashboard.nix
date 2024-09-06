{
  plugins.dashboard = let

    dashboard_custom_header4 = [
      ""
      ""
      ""
      ""
      "██╗░░██╗███████╗███╗░░██╗████████╗░█████╗░██╗"
      "██║░░██║██╔════╝████╗░██║╚══██╔══╝██╔══██╗██║"
      "███████║█████╗░░██╔██╗██║░░░██║░░░███████║██║"
      "██╔══██║██╔══╝░░██║╚████║░░░██║░░░██╔══██║██║"
      "██║░░██║███████╗██║░╚███║░░░██║░░░██║░░██║██║"
      "╚═╝░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝"
      ""
      ""
      ""
      ""
      ""
    ];
  in {
    enable = true;

    settings = {
      theme = "doom";
      config = {
        disable_move = true;
        header = dashboard_custom_header4;
        center = [
          {
            icon = "";
            icon_hl = "number";
            desc = "recent";
            desc_hl = "group";
            key = "r";
            key_hl = "group";
            action = "Telescope oldfiles";
          }
          {
            icon = "";
            icon_hl = "group";
            desc = "projects";
            desc_hl = "group";
            key = "p";
            key_hl = "group";
            action = "Telescope projects";
          }
          {
            icon = "";
            icon_hl = "group";
            desc = "dotfiles";
            desc_hl = "group";
            key = "d";
            key_hl = "group";
            action = "Telescope find_files cwd=~/.config";
          }
        ];

        footer = [ ];
      };
    };
  };
}