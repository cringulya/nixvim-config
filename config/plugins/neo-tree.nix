{
  plugins.neo-tree = {
    enable = true;
    window.mappings = {
      "l" = "open";
      "h" = "close_node";
      "<esc>" = "close_window";
    };
  };

  keymaps = [{
    mode = "n";
    key = "<c-n>";
    action = "<cmd>Neotree toggle<cr>";
  }];
}
