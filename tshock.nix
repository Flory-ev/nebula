{ pkgs, ... }:
{
  systemd.services.tshock = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      DynamicUser = true;
      StateDirectory = "tshock";
      WorkingDirectory = "/var/lib/tshock";
      ExecStart = "${pkgs.tshock}/bin/TShock.Server -world /var/lib/tshock/Riverside.wld -port 7777";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  networking.firewall.allowedTCPPorts = [ 7777 ];
}
