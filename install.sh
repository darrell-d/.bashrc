#!/bin/bash
cp ./.bash_profile_extras ~/
cp ./.bashrc_extras ~/
echo "

if [ -f ~/.bash_profile_extras ]; then
	. ~/.bash_profile_extras
fi
if [ -f ~/.bashrc_extras ]; then
	. ~/.bashrc_extras
fi"  | tee -a ~/.bash_profile

echo "# configuration for customization

alias ..code=''" >> ~/.bash_custom

source ~/.bash_profile