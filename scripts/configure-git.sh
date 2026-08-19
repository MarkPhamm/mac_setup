#!/usr/bin/env bash
set -euo pipefail

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

echo "Configured:"
echo "  git lg"
echo
echo "Current Git identity:"
echo "  name : $(git config --global user.name || echo '<not set>')"
echo "  email: $(git config --global user.email || echo '<not set>')"
echo
echo "If needed:"
echo '  git config --global user.name "Your Name"'
echo '  git config --global user.email "you@example.com"'
