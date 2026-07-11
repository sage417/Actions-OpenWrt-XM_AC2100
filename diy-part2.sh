#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config

# set default theme
mkdir -p package/base-files/files/etc/uci-defaults
cat > package/base-files/files/etc/uci-defaults/99-theme-argon << EOF
#!/bin/sh
uci set luci.main.mediaurlbase=/luci-static/argon
uci commit luci
exit 0
EOF
chmod +x package/base-files/files/etc/uci-defaults/99-theme-argon
