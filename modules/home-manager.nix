{ nixpkgs
, username
, mac-app-util
, nixvim
, ...
}:
let
  pkgs = nixpkgs.pkgs;
in
{
  home-manager.useGlobalPkgs = true;

  home-manager.sharedModules = [
    mac-app-util.homeManagerModules.default
  ];

  home-manager.users.${username} =
    { pkgs, ... }:
    {
      home.stateVersion = "25.05";
      imports = [ nixvim.homeManagerModules.nixvim ];


      home.packages = with pkgs; [
        bat
        fzf
        git
        mas
        nixpkgs-fmt
        nodejs_22
        oh-my-posh
        tmux
      ];

      home.file = {
        ".config/ghostty/config".source = ../dotfiles/ghostty.toml;
        ".hammerspoon/init.lua".source = ../dotfiles/hammerspoon/init.lua;
        ".hammerspoon/modules/leftRightHotKey.lua".source =
          ../dotfiles/hammerspoon/modules/leftRightHotKey.lua;
        ".hammerspoon/Spoons/SpoonInstall.spoon/init.lua".source =
          ../dotfiles/hammerspoon/SpoonInstall.spoon/init.lua;
      };


      programs = {
        zsh = import ./home-manager/programs/zsh.nix { inherit pkgs; };
        oh-my-posh = import ./home-manager/programs/oh-my-posh.nix;
        zoxide = import ./home-manager/programs/zoxide.nix;
        chromium = import ./home-manager/programs/chromium.nix { inherit pkgs; };
        nixvim = import ./home-manager/programs/nixvim.nix;

        direnv = {
          enable = true;
          nix-direnv.enable = true;
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

                "workbench.colorTheme" = "Catppuccin Mocha";
                "catppuccin.accentColor" = "pink";
                "catppuccin.colorOverrides" = {
                  "mocha" = {
                    "base" = "#000000";
                    "mantle" = "#010101";
                    "crust" = "#020202";
                  };
                };
                "catppuccin.customUIColors" = {
                  "mocha" = {
                    "statusBar.foreground" = "accent";
                  };
                };


                "workbench.sideBar.location" = "right";
                "editor.minimap.enabled" = false;

                "editor.accessibilitySupport" = "off";

                "editor.fontFamily" =
                  "OperatorMono Nerd Font, JetBrainsMono Nerd Font, Menlo, Monaco, 'Courier New', monospace";
                "editor.fontLigatures" = false;
                "editor.fontSize" = 15;

                "window.zoomLevel" = 0.5;
                "diffEditor.ignoreTrimWhitespace" = false;

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
                "eslint.validate" = [
                  "javascript"
                  "typescript"
                  "javascriptreact"
                  "typescriptreact"
                ];
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

                "remove-empty-lines.runOnSave" = true;

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
                  # "editor.defaultFormatter" = "kamadorueda.alejandra";
                  "editor.defaultFormatter" = "jnoortheen.nix-ide";
                  # "editor.defaultFormatter" = "brettm12345.nixfmt-vscode";
                  "editor.formatOnPaste" = true;
                  "editor.formatOnSave" = true;
                  "editor.formatOnType" = false;
                  "remove-empty-lines.allowedNumberOfEmptyLines" = 1;

                };
                "[lua]" = {
                  "editor.defaultFormatter" = "sumneko.lua";
                };
                "[toml]" = {
                  "editor.defaultFormatter" = "tamasfe.even-better-toml";
                };

                "files.associations" = {
                  "*.nix" = "nix";
                };
                "nix.formatterPath" = "nixpkgs-fmt";
              };

              extensions = import ./vscode/extensions.nix { inherit pkgs; };

              languageSnippets = {
                typescriptreact = {
                  "React Functional Component" = {
                    "prefix" = [ "ffc" ];
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
      };
    };
}
