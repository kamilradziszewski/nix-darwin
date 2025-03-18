{
  # This property will be used to generate settings.json:
  # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson

  # catppuccin mocha default colors:
  # "base" = "#1e1e2e"; # background
  # "mantle" = "#181825"; # toast, filename, file explorer
  # "crust" = "#11111b"; # border / status bars

  "catppuccin.accentColor" = "pink";
  "catppuccin.colorOverrides" = { "mocha" = { "base" = "#181825"; "mantle" = "#141420"; }; };
  "catppuccin.customUIColors" = { "mocha" = { "statusBar.foreground" = "accent"; }; };
  # "diffEditor.hideUnchangedRegions.enabled" = true;
  "diffEditor.ignoreTrimWhitespace" = false;
  "editor.accessibilitySupport" = "off";
  "editor.codeActionsOnSave" = { "source.fixAll.eslint" = "always"; "source.addMissingImports" = "always"; "source.organizeImports" = "always"; };
  "editor.defaultFormatter" = "esbenp.prettier-vscode";
  # "editor.foldingImportsByDefault" = true;
  "editor.fontFamily" = "OperatorMono Nerd Font, JetBrainsMono Nerd Font, Menlo, Monaco, 'Courier New', monospace";
  "editor.fontLigatures" = false;
  "editor.fontSize" = 15;
  "editor.formatOnPaste" = false;
  "editor.formatOnSave" = true;
  "editor.formatOnType" = false;
  "editor.minimap.enabled" = false;
  "editor.trimAutoWhitespace" = true;
  "eslint.validate" = [ "javascript" "typescript" "javascriptreact" "typescriptreact" ];
  "files.associations" = { "*.nix" = "nix"; };
  "files.insertFinalNewline" = true;
  "files.trimTrailingWhitespace" = true;
  "nix.formatterPath" = "nixpkgs-fmt";
  "search.quickOpen.history.filterSortOrder" = "recency";
  "security.workspace.trust.enabled" = true;
  "security.workspace.trust.startupPrompt" = "never";
  "security.workspace.trust.untrustedFiles" = "open";
  "typescript.suggest.autoImports" = true;
  "window.zoomLevel" = 0.5;
  "workbench.colorTheme" = "Catppuccin Mocha";
  "workbench.editor.showTabs" = "none";
  "workbench.sideBar.location" = "right";
  "workbench.startupEditor" = "none";

  # Language specific settings
  "[css]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[html]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[javascript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[json]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[lua]" = { "editor.defaultFormatter" = "sumneko.lua"; };
  "[nix]" = { "editor.defaultFormatter" = "jnoortheen.nix-ide"; };
  "[nix]" = { "editor.formatOnPaste" = true; };
  "[nix]" = { "editor.formatOnSave" = true; };
  "[nix]" = { "editor.formatOnType" = false; };
  "[scss]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[toml]" = { "editor.defaultFormatter" = "tamasfe.even-better-toml"; };
  "[typescript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
  "[typescriptreact]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
}
