# Copyright (C) 2018-2020 L-WRT Team
# Copyright (C) 2021 xiaorouji
#
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-passwall
PKG_VERSION:=4.51
PKG_RELEASE:=3

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for PassWall
	PKGARCH:=all
	DEPENDS:=+coreutils +coreutils-base64 +coreutils-nohup +curl \
	+dnsmasq-full +dns2socks +ip-full +ipset +ipt2socks +iptables +iptables-mod-tproxy +iptables-mod-iprange \
	+kmod-ipt-nat +libuci-lua +lua +luci-compat +luci-lib-jsonc +microsocks +resolveip +tcping \
	+unzip \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Brook:brook \
	+PACKAGE_$(PKG_NAME)_INCLUDE_ChinaDNS_NG:chinadns-ng \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Haproxy:haproxy \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Hysteria:hysteria \
	+PACKAGE_$(PKG_NAME)_INCLUDE_IPv6_Nat:ip6tables-mod-nat \
	+PACKAGE_$(PKG_NAME)_INCLUDE_NaiveProxy:naiveproxy \
	+PACKAGE_$(PKG_NAME)_INCLUDE_PDNSD:pdnsd-alt \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Libev_Client:shadowsocks-libev-ss-local \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Libev_Client:shadowsocks-libev-ss-redir \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Libev_Server:shadowsocks-libev-ss-server \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Rust_Client:shadowsocks-rust-sslocal \
	+PACKAGE_$(PKG_NAME)_INCLUDE_ShadowsocksR_Libev_Client:shadowsocksr-libev-ssr-local \
	+PACKAGE_$(PKG_NAME)_INCLUDE_ShadowsocksR_Libev_Client:shadowsocksr-libev-ssr-redir \
	+PACKAGE_$(PKG_NAME)_INCLUDE_ShadowsocksR_Libev_Server:shadowsocksr-libev-ssr-server \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Simple_Obfs:simple-obfs \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Trojan_GO:trojan-go \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Trojan_Plus:trojan-plus \
	+PACKAGE_$(PKG_NAME)_INCLUDE_V2ray:v2ray-core \
	+PACKAGE_$(PKG_NAME)_INCLUDE_V2ray_Plugin:v2ray-plugin \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Xray:xray-core \
	+PACKAGE_$(PKG_NAME)_INCLUDE_Xray_Plugin:xray-plugin
endef

PKG_CONFIG_DEPENDS:= \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Brook \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_ChinaDNS_NG \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Haproxy \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Hysteria \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_IPv6_Nat \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_NaiveProxy \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_PDNSD \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Libev_Client \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Libev_Server \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Rust_Client \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Rust_Server \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_ShadowsocksR_Libev_Client \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_ShadowsocksR_Libev_Server \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Simple_Obfs \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Trojan_GO \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Trojan_Plus \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_V2ray \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_V2ray_Plugin \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Xray \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_Xray_Plugin

define Package/$(PKG_NAME)/config
menu "Configuration"

config PACKAGE_$(PKG_NAME)_INCLUDE_Brook
	bool "Include Brook"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_ChinaDNS_NG
	bool "Include ChinaDNS-NG"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_Haproxy
	bool "Include Haproxy"
	default n if aarch64||arm||i386||x86_64

config PACKAGE_$(PKG_NAME)_INCLUDE_Hysteria
	bool "Include Hysteria"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_IPv6_Nat
	depends on PACKAGE_ip6tables
	bool "Include IPv6 Nat"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_NaiveProxy
	bool "Include NaiveProxy"
	depends on !(arc||(arm&&TARGET_gemini)||armeb||mips||mips64||powerpc)
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_PDNSD
	bool "Include PDNSD"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Libev_Client
	bool "Include Shadowsocks Libev Client"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Libev_Server
	bool "Include Shadowsocks Libev Server"
	default n if aarch64||arm||i386||x86_64

config PACKAGE_$(PKG_NAME)_INCLUDE_Shadowsocks_Rust_Client
	bool "Include Shadowsocks Rust Client"
	depends on aarch64||arm||i386||mips||mipsel||x86_64
	default n if aarch64

config PACKAGE_$(PKG_NAME)_INCLUDE_ShadowsocksR_Libev_Client
	bool "Include ShadowsocksR Libev Client"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_ShadowsocksR_Libev_Server
	bool "Include ShadowsocksR Libev Server"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_Simple_Obfs
	bool "Include Simple-Obfs (Shadowsocks Plugin)"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_Trojan_GO
	bool "Include Trojan-GO"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_Trojan_Plus
	bool "Include Trojan-Plus"
	default n

config PACKAGE_$(PKG_NAME)_INCLUDE_V2ray
	bool "Include V2ray"
	default n if aarch64||arm||i386||x86_64

config PACKAGE_$(PKG_NAME)_INCLUDE_V2ray_Plugin
	bool "Include V2ray-Plugin (Shadowsocks Plugin)"
	default n if aarch64||arm||i386||x86_64

config PACKAGE_$(PKG_NAME)_INCLUDE_Xray
	bool "Include Xray"
	default n if aarch64||arm||i386||x86_64

config PACKAGE_$(PKG_NAME)_INCLUDE_Xray_Plugin
	bool "Include Xray-Plugin (Shadowsocks Plugin)"
	default n

endmenu
endef

define Build/Prepare
endef
 
define Build/Configure
endef
 
define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/passwall_server $(1)/etc/config/passwall_server
	
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_CONF) ./root/etc/uci-defaults/* $(1)/etc/uci-defaults
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/passwall $(1)/etc/init.d/passwall
	$(INSTALL_BIN) ./root/etc/init.d/passwall_server $(1)/etc/init.d/passwall_server
	
	$(INSTALL_DIR) $(1)/usr/share/passwall
	cp -pR ./root/usr/share/passwall/* $(1)/usr/share/passwall
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci/
	
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	po2lmo ./po/zh-cn/passwall.po $(1)/usr/lib/lua/luci/i18n/passwall.zh-cn.lmo
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
	chmod a+x $${IPKG_INSTROOT}/usr/share/passwall/* >/dev/null 2>&1
	exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
