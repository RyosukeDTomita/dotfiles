
nix_dir=~/.config/nix
nix_src=~/dotfiles/.config/nix/nix.conf

if [ ! -d "$nix_dir" ]; then
  mkdir -p "$nix_src"
  echo "=====CREATE DIRECTORY $nix_dir====="
fi

if [ -d "$nix_src" ]; then
  for cmd_file in "$nix_src"/*.md; do
    if [ -f "$cmd_file" ]; then
      cmd_basename=$(basename "$cmd_file")
      if [ ! -e "$nix_dir/$cmd_basename" ]; then
        ln -s "$cmd_file" "$nix_dir/$cmd_basename"
        echo "=====CREATE SYMBOLIC LINKS $cmd_file --> $nix_dir/$cmd_basename====="
      fi
    fi
  done
fi
