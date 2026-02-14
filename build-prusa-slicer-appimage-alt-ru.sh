#!/bin/sh

set -eu

ARCH=$(uname -m)

## Install dependencies

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm prusa-slicer nss-mdns base-devel wget

## Install quick-sharun and get-debloated-pkgs
DEBLOATED="https://raw.githubusercontent.com/pkgforge-dev/Anylinux-AppImages/refs/heads/main/useful-tools/get-debloated-pkgs.sh"
SHARUN="https://raw.githubusercontent.com/pkgforge-dev/Anylinux-AppImages/refs/heads/main/useful-tools/quick-sharun.sh"

wget "$DEBLOATED" -O ./get-debloated-pkgs
wget "$SHARUN" -O ./quick-sharun

chmod +x ./get-debloated-pkgs
chmod +x ./quick-sharun

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
./get-debloated-pkgs --add-common --prefer-nano

## Make PrusaSlicer AppImage

rm -rf ./AppDir ./dist

VERSION=$(pacman -Q prusa-slicer | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export ICON=/usr/share/icons/hicolor/192x192/apps/PrusaSlicer.png
export DESKTOP=/usr/share/applications/PrusaSlicer.desktop
export LOCALE_FIX=1
export PATH_MAPPING_HARDCODED='prusa-slicer'
export DEPLOY_P11KIT=1

## Adding Dmitry Sorkin RU alternative translation instead of UK
## https://k3d.tech/projects/ps_translation
cp ./PrusaSlicer.mo /usr/share/PrusaSlicer/localization/uk/

# Deploy dependencies
./quick-sharun \
	/usr/bin/prusa-slicer* \
	/usr/share/PrusaSlicer \
	/usr/lib/libnss_myhostname.so* \
	/usr/lib/libnss_mdns4_minimal.so* \
	/usr/lib/gio/modules/libgio*.so*
# Additional changes can be done in between here

# Turn AppDir into AppImage
./quick-sharun --make-appimage
