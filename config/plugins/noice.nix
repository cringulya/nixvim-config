{
  plugins.noice = {
    enable = true;
    presets = {
      bottom_search = true;
      command_palette = false;
      long_message_to_split = true;
      inc_rename = true;
      lsp_doc_border = true;
    };
    cmdline.view = "cmdline";

    routes = [
      {
        filter = {
          event = "msg_show";
          kind = "";
          find = "written";
        };
        opts = { skip = true; };
      }
      {
        filter = {
          event = "msg_show";
          kind = "lua_error";
          find = "";
        };
        opts = { skip = true; };
      }

    ];

    lsp.override = {
      "vim.lsp.util.convert_input_to_markdown_lines" = true;
      "vim.lsp.util.stylize_markdown" = true;
      "cmp.entry.get_documentation" = true;
    };
  };
}
