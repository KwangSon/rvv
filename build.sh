echo "Build RISCV ${bits} image"

echo "Busybox with static build"
pushd busybox
CROSS_COMPILE=riscv${bits}-linux-gnu- make defconfig
echo "CONFIG_STATIC=y" >> .config
CROSS_COMPILE=riscv${bits}-linux-gnu- make -j $(nproc)
CROSS_COMPILE=riscv${bits}-linux-gnu- make install
popd

echo "Gen rootfs"
# https://github.com/takahirox/riscv-rust/tree/master/resources/linux/opensbi#make-root-file-system-image

echo "Build linux with debug symbol"
pushd linux
ARCH=riscv CROSS_COMPILE=riscv${bits}-linux-gnu- make defconfig
ARCH=riscv CROSS_COMPILE=riscv${bits}-linux-gnu- make -j $(nproc)
popd
