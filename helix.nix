{ ... }:
{
  programs.helix = {
    enable = true;
    languages = [
      {
        name = "ocaml";
        auto-format = true;
      }
    ];
  };
}
