#!/bin/bash

# Function to display messages in red
RED() {
	echo -e "\e[91m$1\e[0m"
}

# Testing if root...
if [ $UID -ne 0 ]; then
	RED "You must run this script as root!" && echo
	exit
fi

# Edit this to the version of firefox you are using, default is "firefox"
firefox="firefox-developer-edition" # I am using the developer edition

# Define the directories
preferences_dir="/lib/${firefox}/browser/defaults/preferences/"
distribution_dir="/lib/${firefox}/distribution/"
extensions_dir="/lib/${firefox}/distribution/extensions/"

# Create directories if they don't exist
mkdir -p "${preferences_dir}"
mkdir -p "${extensions_dir}"
mkdir -p "${distribution_dir}"

# Copy files to the directories
cp -r ./Files/browser/defaults/preferences/* "${preferences_dir}"
cp -r ./Files/distribution/* "${distribution_dir}"
cp -r ./Files/distribution/extensions/* "${extensions_dir}"
