{ pkgs, config, ...}:
{
      home.packages = with pkgs; [
        kitty
        lsd
      ];
      programs.lazygit.enable = true;
      programs.git = {
        enable = true;
        userName = "Paul Corbineau";
        userEmail = "paulcorbineau@gmail.com";
      };
      programs.firefox.enable = true;
      programs.ghostty.enable = true;
      programs.rofi.enable = true;
      programs.waybar = {
        enable = true;
        settings = {
          main = {
            modules-right = [ "clock" ];
          };
        };
        style = # css
          ''
            * {
              font-family: MonaspiceNe Nerd Font Propo;
              font-size: 16px;
            }
                      		    '';
      };
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        extraPackages = with pkgs; [
          nixd
          nixfmt-rfc-style
          lua-language-server
        ];
        plugins = with pkgs.vimPlugins; [
          nvim-treesitter.withAllGrammars
          nvim-lspconfig
          onedark-nvim
	  snacks-nvim
	  oil-nvim
	  which-key-nvim
	  lualine-nvim
	  dropbar-nvim
      blink-cmp
	  (pkgs.vimUtils.buildVimPlugin {
	    name = "compile-mode-nvim";
	    src = pkgs.fetchFromGitHub {
	      owner = "ej-shafran";
	      repo = "compile-mode.nvim";
	      tag = "v5.9.0";
	      sha256 = "sha256-Us/xHSVZyRU2tozC0iu7JLIgXbC6D3geAWNLEO+IZoA=";
	    };
	    dependencies = [ plenary-nvim baleia-nvim ];
	  })
        ];
      };

      home.file."${config.home.homeDirectory}/.config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";

      home.stateVersion = "25.05";
}
