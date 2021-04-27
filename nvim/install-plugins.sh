#! /usr/bin/zsh

cd bundle

cat ../pluginlist | xargs -I _ git clone --progress _
