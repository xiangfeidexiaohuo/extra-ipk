# Copyright (C) 2016 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-xunlei
PKG_VERSION:=1.0.1-8

PKG_MAINTAINER:=gngpp <gngppz@gmail.com>

LUCI_TITLE:=LuCI support for NAS-Xunlei
LUCI_DEPENDS:=+xunlei
LUCI_PKGARCH:=all

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-xunlei ) && rm -f /etc/uci-defaults/luci-xunlei
	exit 0
}
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
