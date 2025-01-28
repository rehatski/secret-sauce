#!/bin/bash

defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g com.apple.swipescrolldirection -bool false

killall cfprefsd
killall Dock
killall Finder
