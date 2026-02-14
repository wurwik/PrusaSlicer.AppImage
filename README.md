# PrusaSlicer-AppImage local-docker-build 🐧

Local PrusaSlicer-AppImage build in docker container, `uk` translation replaced with alternative ru translation from Dmitry Sorkin [LINK](https://k3d.tech/projects/ps_translation)

```bash
git clone \
  --single-branch \
  --branch local-docker-build \
  https://github.com/wurwik/PrusaSlicer.AppImage.git ~/Downloads && \
  cd ~/Downloads/PrusaSlicer.AppImage/ && \
  mkdir ./data
docker run --rm -it -v ./data:/app -w /app --name PrusaSlicer.AppImage ghcr.io/pkgforge-dev/archlinux:latest build-prusa-slicer-appimage-alt-ru.sh
```

---

The template and its scripts are MIT-licensed.
However, PrusaSlicer itself is AGPL-3.0-licensed.


AppImage made using [sharun](https://github.com/VHSgunzo/sharun) and template from [PkgForge/Template-AppImage](https://github.com/pkgforge-dev/TEMPLATE-AppImage/)

**This AppImage bundles everything and should work on any linux distro, even on musl based ones.**
