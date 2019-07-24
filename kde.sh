for i in `cat groups/kf5`; do
    sed -e 's|5.59.0|5.60.0|g' -e '/REL=/d' -i $i/spec
done


for i in `cat groups/kf5`; do
    python3 ../abbs-meta/tools/addchksum.py $i/spec 2>/dev/null
done > checksums.patch

# Patch
patch -Np0 -i checksums.patch
