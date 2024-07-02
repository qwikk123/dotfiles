{
  stdenvNoCC,
  neovim,
  gcc,
  bat,
  fd,
  fzf,
  ripgrep,
  lazygit,
  git,
  makeWrapper,
  lib,
}: let
  # Runtime deps for lazyvim
  runtimeDeps = [
    # git stuff
    git
    lazygit
    # Need C compiler for nvim-treesitter
    gcc
    fd
    fzf
    ripgrep
  ];
in
  stdenvNoCC.mkDerivation {
    pname = "neovim-with-runtime-deps";
    inherit (neovim) version;

    dontUnpack = true;
    dontBuild = true;
    buildPhase = null;

    nativeBuildInputs = [makeWrapper];

    installPhase = ''
      # Wrap neovim
      makeWrapper "${neovim}/bin/nvim" "$out/bin/nvim" \
        --prefix PATH : "${lib.makeBinPath runtimeDeps}"
      install -Dm644 "${neovim}/share/applications/nvim.desktop" -t $out/share/applications
    '';
  }
