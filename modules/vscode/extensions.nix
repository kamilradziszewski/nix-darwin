{pkgs, ...}: let
  vscodeExtensions = with pkgs.vscode-extensions;
    [
      # Alejandra 💅
      kamadorueda.alejandra

      # Auto Rename Tag
      formulahendry.auto-rename-tag

      # Continue - Codestral, Claude, and more
      continue.continue

      # ESLint
      dbaeumer.vscode-eslint

      # GitLens — Git supercharged
      eamodio.gitlens

      # Lua
      sumneko.lua

      # Prettier - Code formatter
      esbenp.prettier-vscode

      # Tailwind CSS IntelliSense
      bradlc.vscode-tailwindcss
    ]
    ++ (with pkgs.vscode-marketplace; [
      # ES7+ React/Redux/React-Native snippets
      dsznajder.es7-react-js-snippets

      # Tailwind Sorter
      dejmedus.tailwind-sorter
    ]);
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
in
  vscodeExtensions
