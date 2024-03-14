#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo ${BASEDIR}

echo "Linking dot files"
ln -s ${BASEDIR}/nvim ~/.config/


