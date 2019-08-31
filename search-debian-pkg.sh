#!/bin/bash

set -e

function search_pacman() {
  local pkg="$1"
  pacman -Ss ^"${pkg}"$
}

function search_aur() {
  local pkg="$1"
  yay -Ss "${pkg}" --aur | grep "/${pkg}"
}



while IFS='' read -r pkg || [[ -n "$pkg" ]]; do
    #( pacman -Ss ^"${pkg}"$ || yay -Ss "${pkg}" --aur | grep "/${pkg}" ) && echo found || echo not found
    ( pacman -Ss ^"${pkg}"$ > /dev/null 2>&1 || yay -Ss "${pkg}" --aur | grep "/${pkg}" > /dev/null 2>&1 ) || echo -e "package: ${pkg}  not found" 

done < ./debian-packages
 
