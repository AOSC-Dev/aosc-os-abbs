set -x
VER=123.0.6312.58
PREFIX=/buildroots/jiegec/build-chromium/chromium-loongarch64/chromium/chromium-$VER
cp $PREFIX.*.diff .
rename -v chromium-$VER. "" *.diff
rename -v .diff .patch *.diff
