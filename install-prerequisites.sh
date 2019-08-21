#!/bin/bash

set -ex

pacman -Syyu
pacman -S git curl wget ansible yay --noconfirm