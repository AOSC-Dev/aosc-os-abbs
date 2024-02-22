set -x
VER=122.0.6261.57
PREFIX=/buildroots/jiegec/build-chromium/chromium-loongarch64/chromium/chromium-$VER
cp $PREFIX.*.diff .
rename -v chromium-$VER. "" *.diff
rename -v .diff .patch *.diff
