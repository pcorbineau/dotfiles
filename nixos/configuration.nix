{ pkgs, ... }:
let
  sddm-theme = pkgs.sddm-astronaut.override { embeddedTheme = "purple_leaves"; };
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  hardware.bluetooth.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.timeout = null;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = with pkgs; [
      sddm-theme
      kdePackages.qtsvg
      kdePackages.qtmultimedia
      kdePackages.qtvirtualkeyboard
    ];
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    wayland.compositor = "kwin";
    enableHidpi = true;
    settings = {
      #   Autologin = {
      #     Session = "hyprland";
      #     User = "pcorbineau";
      #   };
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pcorbineau = {
    isNormalUser = true;
    description = "pcorbineau";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
  };
  programs.waybar.enable = true;

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.monaspace
  ];

  environment.systemPackages = with pkgs; [
    sddm-theme
    kdePackages.dolphin
  ];

  # Enable flakes experimental
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05";

}
