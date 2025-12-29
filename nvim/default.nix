{
  lib,
  neovim-unwrapped,
  wrapNeovimUnstable,
  neovimUtils,
  vimPlugins,
  symlinkJoin,
}:

let
    runtimeDeps = [
      # add packages here if needed
    ];

    nvimConfig = neovimUtils.makeNeovimConfig {
      withRuby = false;
      withPython3 = false;
      extraPackages = runtimeDeps;

      wrapperArgs = [
        "--prefix"
        "PATH"
        ":"
        "${lib.makeBinPath runtimeDeps}"
      ];

      customRC = ''
        set runtimepath^=${./.}
        source ${./.}/lua/plugins.lua
      '';

      plugins = with vimPlugins; [
        nvim-treesitter.withAllGrammars
        lean-nvim
      ];
    };

    nvim = wrapNeovimUnstable neovim-unwrapped nvimConfig;
in

    symlinkJoin {
      name = "nvim-with-deps";
      paths = [ nvim ] ++ runtimeDeps;
    }
