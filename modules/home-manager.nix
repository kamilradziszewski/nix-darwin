{
  nixpkgs,
  username,
  mac-app-util,
  ...
}: let
  pkgs = nixpkgs.pkgs;
in {
  home-manager.useGlobalPkgs = true;

  home-manager.sharedModules = [
    mac-app-util.homeManagerModules.default
  ];

  home-manager.users.${username} = {pkgs, ...}: {
    home.stateVersion = "25.05";

    # home.sessionVariables = {
    #   HOMEBREW_NO_ENV_HINTS = "1";
    # };

    home.packages = with pkgs; [
      alejandra
      bat
      fzf
      git
      nodejs_22
      oh-my-posh
      tmux
    ];

    home.file = {
      ".config/ghostty/config".source = ../dotfiles/ghostty;
      ".hammerspoon/init.lua".source = ../dotfiles/hammerspoon;
    };

    programs = {
      zsh = {
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
        };

        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
          ];
          # theme = "robbyrussell";
          # theme = "agnoster";
        };

        # initExtra = ''
        #   export HOMEBREW_NO_ENV_HINTS=1
        # '';
      };

      oh-my-posh = {
        enable = true;
        enableZshIntegration = true;
        # useTheme = "cobalt2";
        # useTheme = "M365Princess";
        # useTheme = "dracula";
        useTheme = "marcduiker";
      };

      zoxide = {
        enable = true;
        enableZshIntegration = true;
        options = ["--cmd cd"];
      };

      vscode = {
        enable = true;

        #          extensions = [
        #             pkgs.vscode-marketplace.formulahendry.auto-rename-tag
        #          pkgs.vscode-marketplace.bradlc.vscode-tailwindcss
        #         pkgs.vscode-marketplace.dbaeumer.vscode-eslint
        #        pkgs.vscode-marketplace.dejmedus.tailwind-sorter
        #       pkgs.vscode-marketplace.dsznajder.es7-react-js-snippets
        #      pkgs.vscode-marketplace.eamodio.gitlens
        #     pkgs.vscode-marketplace.esbenp.prettier-vscode
        #    pkgs.vscode-marketplace.kamadorueda.alejandra
        #   pkgs.vscode-marketplace.Continue.continue
        #];

        profiles = {
          default = {
            userSettings = {
              # This property will be used to generate settings.json:
              # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson

              "workbench.sideBar.location" = "right";
              "editor.minimap.enabled" = false;

              "editor.accessibilitySupport" = "off";

              "editor.fontFamily" = "OperatorMono Nerd Font, JetBrainsMono Nerd Font, Menlo, Monaco, 'Courier New', monospace";
              "editor.fontLigatures" = false;
              "editor.fontSize" = 15;

              "window.zoomLevel" = 0.5;

              "diffEditor.hideUnchangedRegions.enabled" = true;

              "editor.formatOnSave" = true;
              "editor.formatOnPaste" = false;
              "editor.formatOnType" = false;
              "editor.trimAutoWhitespace" = true;
              "files.trimTrailingWhitespace" = true;
              "files.insertFinalNewline" = true;
              "editor.defaultFormatter" = "esbenp.prettier-vscode";

              "editor.codeActionsOnSave" = {
                "source.fixAll" = "explicit";
                "source.addMissingImports" = "explicit";
                "source.organizeImports" = "explicit";
              };
              "eslint.validate" = ["javascript" "typescript" "javascriptreact" "typescriptreact"];
              "typescript.suggest.autoImports" = true;

              "security.workspace.trust.untrustedFiles" = "open";
              "security.workspace.trust.enabled" = true;
              "security.workspace.trust.startupPrompt" = "never";

              "workbench.startupEditor" = "none";

              "search.quickOpen.history.filterSortOrder" = "recency";

              "workbench.editor.showTabs" = "none";
              # "workbench.editor.showTabs" = "single";
              # "workbench.editor.enablePreview" = false;
              # "explorer.openEditors.visible" = 0;

              # "nix.formatterPath"= "/Users/kamil/.nix-profile/bin/alejandra";

              "[typescript]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
              };
              "[typescriptreact]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
              };
              "[json]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
              };
              "[javascript]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
              };
              "[html]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
              };
              "[css]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
              };
              "[scss]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
              };
              "[nix]" = {
                "editor.defaultFormatter" = "kamadorueda.alejandra";
                "editor.formatOnPaste" = true;
                "editor.formatOnSave" = true;
                "editor.formatOnType" = false;
              };
              "[lua]" = {
                "editor.defaultFormatter" = "sumneko.lua";
              };
            };

            extensions = import ./vscode/extensions.nix {inherit pkgs;};

            languageSnippets = {
              typescriptreact = {
                "React Functional Component" = {
                  "prefix" = ["ffc"];
                  "body" = [
                    "import { FC } from \"react\";"
                    "interface \${TM_FILENAME_BASE}Props {}"
                    ""
                    "const \$TM_FILENAME_BASE: FC<\${TM_FILENAME_BASE}Props> = () => {"
                    "  return <div>null$2</div>"
                    "};"
                    ""
                    "export default \$TM_FILENAME_BASE"
                    ""
                  ];
                  "description" = "React Functional Component";
                };
              };
            };
          };
        };
      };

      chromium = {
        enable = true;
        package = pkgs.brave;

        commandLineArgs = [
          "--rewards=disabled"
          "--autoplay-policy=user-gesture-required"
        ];

        extensions = [
          {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden Password Manager
          # pkgs.chromium-ublock-origin
          # pkgs.chromium-privacy-badger
          # pkgs.chromium-dark-reader
          # pkgs.chromium-https-everywhere
          # pkgs.chromium-privacy-redirect
          # pkgs.chromium-privacy-pass
          # pkgs.chromium-privacy-settings
        ];
      };
    };
  };
}
