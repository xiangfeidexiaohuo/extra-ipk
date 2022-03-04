#
# Copyright (C) 2017-2019 Xingwang Liao <kuoruan@gmail.com>
#
# This is free software, licensed under the MIT License.
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for Aria2
LUCI_DEPENDS:=+luci-compat +aria2 +luci-lib-ipkg +ariang
PKG_VERSION:=1.1.0
PKG_RELEASE:=$(AUTORELEASE)

PKG_MAINTAINER:=Xingwang Liao <kuoruan@gmail.com>
PKG_LICENSE:=MIT

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
