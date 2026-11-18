{ pkgs, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  environment.systemPackages = [ pkgs.git ];

  networking.hostName = "nebula";

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
    settings.experimental-features = [ "flakes" "nix-command" ];
  };

  security.sudo.wheelNeedsPassword = false;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  system.stateVersion = "25.11";

  users.users.f = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIHCVvyYWTh38gd4d+Pxaro9HaMhrYsRtMTZNc3wBtS7"
    ];
  };
}
