#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

echo "Apply custom.sh"

rm -rf feeds/packages/libs/libcap
rm -rf package/feeds/routing/olsrd/patches/012-gpsd.patch
rm -rf feeds/packages/net/smartdns
rm -rf package/lean/luci-theme-argon


svn co https://github.com/openwrt/packages/trunk/libs/libcap                                             feeds/packages/libs/libcap
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                          package/adg
svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns                                     package/smartdns


git clone https://github.com/pymumu/luci-app-smartdns.git -b lede                                        package/luci-app-smartdns
git clone https://github.com/hyird/Openwrt-AdguardHome.git                                               package/AdGuardHome
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git                             package/luci-theme-infinityfreedom
git clone https://github.com/yangsongli/luci-theme-atmaterial.git                                        package/luci-theme-atmaterial
git clone https://github.com/jerrykuku/luci-theme-argon.git -b 18.06                                     package/luci-theme-argon-jerrykuku
git clone https://github.com/tty228/luci-app-serverchan.git                                              package/luci-app-serverchan
git clone https://github.com/vernesong/OpenClash.git -b master  --depth=1                                package/luci-app-openclash
git clone https://github.com/tindy2013/openwrt-subconverter.git                                          package/openwrt-subconverter
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git                                         package/luci-theme-opentomcat
git clone https://github.com/Leo-Jo-My/luci-theme-opentomato.git                                         package/luci-theme-opentomato
git clone https://github.com/jerrykuku/luci-app-argon-config.git                                         package/luci-app-argon-config
git clone https://github.com/jerrykuku/lua-maxminddb.git                                                 package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git                                                 package/luci-app-vssr
git clone https://github.com/hyird/luci-theme-darkmatter.git		                                         package/luci-theme-darkmatter
git clone https://github.com/garypang13/luci-app-dnsfilter.git                                           package/luci-app-dnsfilter
git clone https://github.com/CCnut/feed-netkeeper.git -b LUCI-LUA-UCITRACK                               package/feed-netkeeper


sed -i 's/DEPENDS.*/& \+kmod-tun +libcap-bin/g'  package/luci-app-openclash/luci-app-openclash/Makefile
sed -i 's/DEPENDS.*/& \+luci-i18n-mwan3-zh-cn/g'  package/lean/luci-app-syncdial/Makefile
sed -i 's/DEPENDS.*/& \+kmod-usb-core +kmod-usb-ohci +kmod-usb-uhci +kmod-usb-storage +kmod-usb-storage-extras +kmod-usb2 +kmod-scsi-core/g'  package/lean/automount/Makefile
# git clone https://github.com/garypang13/luci-app-bypass.git                                              package/luci-app-bypass
# git clone https://github.com/garypang13/smartdns-le.git                                                  package/smartdns-le
# svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns-le                                  package/smartdns-le
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
# find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}
