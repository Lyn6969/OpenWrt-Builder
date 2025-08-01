#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git luci_lean https://github.com/coolsnowwolf/luci.git;openwrt-24.10' >>feeds.conf.default
# echo 'src-git packages_lean https://github.com/coolsnowwolf/packages.git;master' >>feeds.conf.default

sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# 使用 O2 级别的优化
sed -i 's,Os,O2 -march=x86-64-v3,g' include/target.mk

# 关闭 Spectre & Meltdown 补丁
sed -i 's,noinitrd,noinitrd mitigations=off,g' target/linux/x86/image/grub-efi.cfg
sed -i 's,noinitrd,noinitrd mitigations=off,g' target/linux/x86/image/grub-iso.cfg
sed -i 's,noinitrd,noinitrd mitigations=off,g' target/linux/x86/image/grub-pc.cfg
