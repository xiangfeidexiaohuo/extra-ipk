# 
# Copyright (C) 2010-2011 OpenWrt.org
#  2020  by lean
#  2021-2022 by sirpdboy  (sirpdboy@qq.com)
#  2022 by xiangfeidexiaohuo  (jsjson@163.com)
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=autocore
PKG_VERSION:=2
PKG_RELEASE:=12

include $(INCLUDE_DIR)/package.mk

define Package/autocore-arm
  TITLE:=Arm auto core loadbalance script.
  MAINTAINER:=CN_SZTL
  DEPENDS:=@(arm||aarch64) \
    +TARGET_bcm27xx:bcm27xx-userland \
	+TARGET_bcm53xx:nvram +ethtool
  VARIANT:=arm
endef

define Package/autocore-x86
  TITLE:=x86/x64 auto core loadbalance script.
  MAINTAINER:=Lean
  DEPENDS:=@TARGET_x86 +bc +lm-sensors +ethtool
  VARIANT:=x86
endef

define Package/autocore-arm/description
  A luci autoconfig hotplug script.
endef

define Package/autocore-x86/description
  A usb autoconfig hotplug script.
endef

define Build/Compile
endef

define Package/autocore-arm/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/arm/index.htm $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/arm/090-cover-index_htm $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/generic/cntime $(1)/sbin/
	$(INSTALL_BIN) ./files/generic/cpuinfo $(1)/sbin/
	$(INSTALL_BIN) ./files/generic/ethinfo $(1)/sbin/
	$(INSTALL_BIN) ./files/arm/tempinfo $(1)/sbin/
	$(INSTALL_BIN) ./files/arm/usage $(1)/sbin/usage
endef

define Package/autocore-x86/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/x86/autocore $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DATA) ./files/x86/index.htm $(1)/etc/index.htm
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/generic/cntime $(1)/sbin/
	$(INSTALL_BIN) ./files/generic/cpuinfo $(1)/sbin/
	$(INSTALL_BIN) ./files/generic/ethinfo $(1)/sbin/
	$(INSTALL_BIN) ./files/x86/tempinfo $(1)/sbin/
endef

$(eval $(call BuildPackage,autocore-arm))
$(eval $(call BuildPackage,autocore-x86))
