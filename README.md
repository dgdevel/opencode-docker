# opencode-docker

A set of scripts to run opencode in a docker container.
It will create a docker container, using `homedir/` as an isolated home directory for the docker user and your project path will be placed in `/home/coder/project` inside the container to work on.

## Requirements
Tested on Linux, but should work on any unix that have docker, a shell and jshon.

## Usage

1. Customize your configuration editing `homedir/.config/opencode/opencode.jsonc` (contains an example for llama.cpp usage, some MCPs, see https://opencode.ai/docs/config/ for more details)
2. Customize your developement dependencies in `Dockerfile` (see comment at head of file)
3. Run with `./run.sh [path-of-project]`

If you need a shell to run inside the container use `./shell.sh` to run.

## Known bugs

- Ctrl+p won't show the menu unless you press another key (like the arrow keys).

