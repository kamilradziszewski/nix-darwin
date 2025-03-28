{ pkgs, ... }: {
  plugins = [
    {
      name = "you-should-use";
      src = "${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use";
    }
  ];

  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    nr = "npm run ";
    ll = "ls -alh";
    cat = "bat";
    lg = "lazygit";
  };

  oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
    ];
    theme = "";
  };

  initExtra = ''
    export HOMEBREW_NO_AUTO_UPDATE=1
  '';
}
