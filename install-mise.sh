#!/bin/bash
# https://mise.jdx.dev/getting-started.html
curl https://mise.run | sh

# C Compiler
# NOTE: 一部ツールを入れる際にgccがないとエラーになる
sudo apt update
sudo apt install build-essential libevent-dev libncurses-dev pkg-config automake bison

