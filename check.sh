#!/bin/bash

PREVIOUS_VERSION=$(cat latest)
CURRENT_VERSION=$(curl https://api.github.com/repos/Anuken/Mindustry/releases/latest | jq ".tag_name" -r)

[[ $PREVIOUS_VERSION != $CURRENT_VERSION ]]

echo "VERSION_UPDATED=$?" >> "$GITHUB_OUTPUT"
echo "VERSION=$CURRENT_VERSION" >> "$GITHUB_OUTPUT"

cat $GITHUB_OUTPUT

echo $CURRENT_VERSION > latest
