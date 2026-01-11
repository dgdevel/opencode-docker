#!/usr/bin/env sh
set -e
if [ "$1" = "" ]; then
  echo "Usage: $0 [path-of-project]"
  exit 1
fi

docker_active=$(systemctl is-active docker)

if [ "$docker_active" = inactive ]; then
  sudo systemctl start docker
fi

docker buildx build -t opencode-ai .

exec docker run --rm -it \
  -v "$PWD/homedir:/home/coder" \
  --mount "type=bind,source=$PWD/$1,target=/home/coder/project" \
  -e TERM=$TERM \
  -e COLUMNS=$(tput cols) \
  -e LINES=$(tput lines) \
  -p 4096:4096 \
  --add-host host.docker.internal:host-gateway \
  opencode-ai

