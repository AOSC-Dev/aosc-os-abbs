set -x
VER=124.0.6367.60
PREFIX=/buildroots/jiegec/build-chromium/chromium-loongarch64/chromium/chromium-$VER
cp $PREFIX.*.diff .
rename -v chromium-$VER. "" *.diff
rename -v .diff .patch *.diff
