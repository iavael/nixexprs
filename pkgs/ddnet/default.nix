{ stdenv, fetchFromGitHub
, python, alsaLib, xorg, mesa, SDL2, lua5, zlib, bam, pkgconfig, freetype, libogg, libopus, opusfile, curl
}:

stdenv.mkDerivation rec {
  name = "ddnet-${version}";
  version = "10.3";
  rev = "${version}";

  src = fetchFromGitHub {
    inherit rev;
    owner = "ddnet";
    repo = "ddnet";
    sha256 = "1n78iwd3p7cjlhmpd92h05j1y910lcxqn8k7abl10qp900wapf5j";
  };

  patches = [
    ./patches/winonly-freetype-bundled-headers.patch
  ];

  buildInputs = [ python alsaLib xorg.libX11 mesa SDL2 lua5 zlib bam pkgconfig freetype libogg libopus opusfile curl ];

  configurePhase = ''
    bam release
  '';

  installPhase = ''
    # Copy the graphics, sounds, etc.
    mkdir -p "$out/share/${name}"
    cp -rv data other/icons "$out/share/${name}"

    # Copy the executables (client, server, etc.).
    mkdir -p "$out/bin"
    executables=""
    for file in *
    do
      if [ -f "$file" ] && [ -x "$file" ]
      then
          executables="$file $executables"
      fi
    done
    cp -v $executables "$out/bin"

    # Make sure the programs are executed from the right directory so
    # that they can access the graphics and sounds.
    for program in $executables
    do
      mv -v "$out/bin/$program" "$out/bin/.wrapped-$program"
      cat > "$out/bin/$program" <<EOF
#!/bin/sh
cd "$out/share/${name}" && exec "$out/bin/.wrapped-$program" "\$@"
EOF
      chmod -v +x "$out/bin/$program"
    done

    # Copy the documentation.
    mkdir -p "$out/doc/${name}"
    cp -v *.txt "$out/doc/${name}"
  '';

  meta = {
    description = "Retro multiplayer shooter game";

    longDescription = ''
      Teeworlds is a free online multiplayer game, available for all
      major operating systems.  Battle with up to 12 players in a
      variety of game modes, including Team Deathmatch and Capture The
      Flag.  You can even design your own maps!
    '';

    homepage = https://ddnet.tw/;
    license = "BSD-style, see `license.txt'";
    maintainers = with stdenv.lib.maintainers; [ astsmtl ];
    platforms = with stdenv.lib.platforms; linux;
  };
}
