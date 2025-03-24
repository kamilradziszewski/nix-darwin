{
  enable = true;
  globals.mapleader = " ";

  colorschemes.catppuccin.enable = true;

  extraConfigLua = ''
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#181825";
          mantle = "#141420";
        },
      },
    })
    vim.cmd[[colorscheme catppuccin]]
  '';


  opts = {
    number = true;
    relativenumber = true;
    cursorline = true;
    cursorcolumn = true;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    smartindent = true;
    # wrap = false;
    # termguicolors = true;
    # clipboard = "unnamedplus";
    # undofile = true;
    # undodir = "${XDG_STATE_HOME}/nvim/undo";
  };

  plugins = {
    lualine = {
      enable = true;
    };

    web-devicons = {
      enable = true;
    };

    telescope = {
      enable = true;
      settings = {
        defaults = {
          file_ignore_patterns = [
            "node_modules"
            ".git"
            "dist"
            "build"
          ];
        };
      };
    };

    neo-tree = {
      enable = true;
    };

    treesitter = {
      enable = true;
    };
  };
}
