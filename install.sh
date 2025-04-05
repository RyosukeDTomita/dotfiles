#/bin/bash
# NOTE: The environment variable `REMOTE_CONTAINERS` is true in Dev Containers.
if [ "${REMOTE_CONTAINERS}" != "true" ]; then
  exit
fi

for f in $(ls -a ~/dotfiles | grep "^\.[a-zA-Z0-9]"); do
  if [ "${f}" = ".git" ] || [ "${f}" = ".config" ] || [ "${f}" = ".ssh" ]; then
    continue
  fi
  cp ~/dotfiles/${f} ~/${f}
done
