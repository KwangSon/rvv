qemu-system-riscv${bits} -nographic -machine virt \
     -kernel linux/arch/riscv/boot/Image -append "root=/dev/vda ro console=ttyS0" \
     -drive file=busybox/rootfs.img,format=raw,id=hd0 \
     -device virtio-blk-device,drive=hd0
