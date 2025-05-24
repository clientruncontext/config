{ lib, config, pkgs, ... }:

{
	options = {
		main-user.userName = lib.mkOption {
			default = "clientruncontext";
			description = ''
				Username
			'';
		};
		main-user.realName = lib.mkOption {
			default = "clientruncontext";
			description = ''
				User's Name
			'';
		};
		main-user.packages = lib.mkOption {
			default = [];
			description = ''
				User's Packages
			'';
		};
	};

	config = {
		users.users.${config.main-user.userName} = {
			isNormalUser = true;
			initialPassword = "password";
			description = "${config.main-user.realName}";
			shell = pkgs.zsh;
			extraGroups = [ "networkmanager" "wheel" "input" "video" "libvirtd" "power" ];
			packages = config.main-user.packages;
		};
	};

}
