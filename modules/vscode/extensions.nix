{ pkgs, ... }:
let
  vscodeExtensions = with pkgs.open-vsx; [
    formulahendry.auto-rename-tag # Auto Rename Tag
    aaron-bond.better-comments # Better Comments
    catppuccin.catppuccin-vsc # Catppuccin for VSCode
    sourcegraph.cody-ai # Cody: AI Code Assistant
    dsznajder.es7-react-js-snippets # ES7+ React/Redux/React-Native snippets
    dbaeumer.vscode-eslint # ESLint
    tamasfe.even-better-toml # Even Better TOML
    eamodio.gitlens # GitLens — Git supercharged
    sumneko.lua # Lua
    jnoortheen.nix-ide # Nix ide
    esbenp.prettier-vscode # Prettier - Code formatter
    bradlc.vscode-tailwindcss # Tailwind CSS IntelliSense
    usernamehw.remove-empty-lines # Remove empty lines
  ];
in
vscodeExtensions

# dejmedus.tailwind-sorter # Tailwind Sorter
# aaron-bond.better-comments # Better Comments
# bradlc.vscode-tailwindcss # Tailwind CSS IntelliSense
# catppuccin.catppuccin-vsc # Catppuccin for VSCode
# dbaeumer.vscode-eslint # ESLint
# dejmedus.tailwind-sorter # Tailwind Sorter
# dsznajder.es7-react-js-snippets # ES7+ React/Redux/React-Native snippets
# eamodio.gitlens # GitLens — Git supercharged
# esbenp.prettier-vscode # Prettier - Code formatter
# formulahendry.auto-rename-tag # Auto Rename Tag
# jnoortheen.nix-ide # Nix ide
# sourcegraph.cody-ai # Cody: AI Code Assistant
# sumneko.lua # Lua
# tamasfe.even-better-toml # Even Better TOML
# arrterian.nix-env-selector # Nix Environment Selector
# codeium.codeium
# continue.continue # Continue - Codestral, Claude, and more
# ecmel.vscode-html-css
# genieai.chatgpt-vscode
# github.copilot
# irongeek.vscode-env
# jnoortheen.nix-ide
# kuscamara.remove-unused-imports
# sourcegraph.cody-ai # Cody: AI Code Assistant
# steoates.autoimport
# streetsidesoftware.code-spell-checker
# usernamehw.remove-empty-lines # Remove empty lines
# visualstudioexptteam.vscodeintellicode
