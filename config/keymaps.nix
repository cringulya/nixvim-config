{
  keymaps = [
    {
      mode = "n";
      key = "Q";
      action = "<cmd>bd!<cr>";
    }

    {
      key = "H";
      action = "0";
    }

    {
      key = "L";
      action = "$";
    }

    {
      mode = "t";
      key = "<esc>";
      action = "<c-\\><c-n><cr>";
    }

    {
      mode = "t";
      key = "<c-v>";
      action = ''<c-\><c-n>"+pi'';
    }

    {
      mode = "n";
      key = "<esc>";
      action = "<cmd>Trouble qflist close<cr><cmd>NvimTreeClose<cr>";
    }

    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>nohl<cr><cmd>NoiceDismiss<cr>";
    }
  ];

  autoCmd = [{
    event = [ "FileType" ];
    pattern = [ "cpp" "c" "h" "hpp" ];
    callback.__raw = ''
      function()
        vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", { buffer = true })
      end
    '';
  }];

  extraConfigVim = ''
    set langmap=АF,Б<,ВD,ГU,ДL,ЕT,Ё`,Ж:,ЗP,ИB,ЙQ,КR,ЛK,МV,НY,ОJ,ПG,РH,СC,ТN,УE,ФA,Х[,ЦW,ЧX,ШI,ЩO,Ъ],ЫS,ЬM,Э',Ю.,ЯZ,аf,б>,вd,гu,дl,еt,ё`,ж:,зp,иb,йq,кr,лk,мv,нy,оj,пg,рh,сc,тn,уe,фa,х[,цw,чx,шi,щo,ъ],ыs,ьm,э',ю.,яz
  '';
}
