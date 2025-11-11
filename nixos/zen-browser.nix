{ inputs, lib, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "*" = {
          blocked_install_message = "Addon is not added in the nix config";
          installation_mode = "blocked";
        };
        "uBlock0@raymondhill.net" = {
          private_browsing = true;
          default_area = "navbar";
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
      };
      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net" = {
          advancedSettings = [
            [
              "userResourcesLocation"
              "https://raw.githubusercontent.com/pixeltris/TwitchAdSolutions/master/video-swap-new/video-swap-new-ublock-origin.js"
            ]
          ];
          adminSettings = {
            userFilters = lib.concatMapStrings (x: x + "\n") [
              "twitch.tv##+js(twitch-videoad)"
            ];
            selectedFilterLists = [
              "fanboy-cookiemonster"
              "ublock-cookies-easylist"
              "adguard-cookies"
              "ublock-cookies-adguard"
            ];
          };
        };
      };
    };
  };
}
