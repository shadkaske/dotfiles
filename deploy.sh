#!/bin/bash

find -maxdepth 1 -path './[^.]*' -type d -printf '%f\n' | xargs stow
