{ ... }:
{
  programs.git = {
    enable = true;
    # I use extraConfig where the nix
    # config doesn't do much more, since it is easier
    # to understand without a nix background
    extraConfig = {
      user = {
        email = "vincent@woltmann.art";
        name = "Vincent Woltmann";
        signingkey = "3101B032E24179D241E87BB8CEACC46E985387D0";
      };
      commit = {
        # always sign
        gpgsign = true;
      };
      push = {
        autoSetupRemote = true;
        # By default only pus hthe current branch
        default = "simple";
      };
      pull = {
        # always rebase to prevent annoying merge commits
        rebase = true;
        # allows rebase pulling with locale changes
        autoStash = true;
        # automatically detect fixup!, squash!
        autoSquash = true;
      };
      fetch = {
        # regulary prune unreachable objects
        # deletes branches that have been deleted on the
        # remote, but not locally
        prune = true;
      };
    };
    lfs.enable = true;
  };
}
