{ pkgs, ... }:
let
  vscodeExtensions =
    with pkgs.vscode-extensions;
    [
      formulahendry.auto-rename-tag # Auto Rename Tag
      continue.continue # Continue - Codestral, Claude, and more
      dbaeumer.vscode-eslint # ESLint
      tamasfe.even-better-toml # Even Better TOML
      eamodio.gitlens # GitLens — Git supercharged
      sumneko.lua # Lua
      jnoortheen.nix-ide # Nix ide
      esbenp.prettier-vscode # Prettier - Code formatter
      bradlc.vscode-tailwindcss # Tailwind CSS IntelliSense
      catppuccin.catppuccin-vsc # Catppuccin for VSCode

      # usernamehw.remove-empty-lines # Remove empty lines
      # arrterian.nix-env-selector # Nix Environment Selector

      # ]
      # ++ (with pkgs.vscode-marketplace; [
      #   dsznajder.es7-react-js-snippets # ES7+ React/Redux/React-Native snippets
      #   dejmedus.tailwind-sorter # Tailwind Sorter
      # ]);
    ];
in
vscodeExtensions

# sourcegraph.cody-ai
# genieai.chatgpt-vscode
# visualstudioexptteam.vscodeintellicode
# jnoortheen.nix-ide
# github.copilot
# codeium.codeium
# ecmel.vscode-html-css
# irongeek.vscode-env
# kuscamara.remove-unused-imports
# steoates.autoimport
# streetsidesoftware.code-spell-checker
