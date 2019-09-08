#!/bin/bash

set -ex

pacman -Syyu --noconfirm
pacman -S git curl wget ansible yay --noconfirm