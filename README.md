# PrusaSlicer-AppImage local-docker-build 🐧

Local `PrusaSlicer-AppImage` build in docker container, `uk` translation replaced with alternative `ru` translation from Dmitry Sorkin [LINK](https://k3d.tech/projects/ps_translation)

```bash
## Clone repository files, and prepare data folder for docker container
git clone \
  --single-branch \
  --branch local-docker-build \
  https://github.com/wurwik/PrusaSlicer.AppImage.git ~/Downloads/PrusaSlicer.AppImage && \
  cd ~/Downloads/PrusaSlicer.AppImage/ && \
  mkdir ./data && cp ./build-prusa-slicer-appimage-alt-ru.sh ./PrusaSlicer.mo ./data && \
  chmod +x ./data/build-prusa-slicer-appimage-alt-ru.sh

## Run PrusaSlicer.AppImage build in container
docker run --rm -it \
    -v ./data:/app \
    -w /app \
    --name PrusaSlicer.AppImage \
    ghcr.io/pkgforge-dev/archlinux:latest \
    ./build-prusa-slicer-appimage-alt-ru.sh

## (optionally for debug)
docker run --rm -it \
    -v ./data:/app \
    -w /app \
    --name PrusaSlicer.AppImage \
    ghcr.io/pkgforge-dev/archlinux:latest bash
```

Package location after successful build `~/Downloads/PrusaSlicer.AppImage/data/dist/PrusaSlicer-<VERSION>-anylinux-x86_64.AppImage`

---

The template and its scripts are MIT-licensed.
However, PrusaSlicer itself is AGPL-3.0-licensed.


AppImage made using [sharun](https://github.com/VHSgunzo/sharun) and template from [PkgForge/Template-AppImage](https://github.com/pkgforge-dev/TEMPLATE-AppImage/)

**This AppImage bundles everything and should work on any linux distro, even on musl based ones.**
