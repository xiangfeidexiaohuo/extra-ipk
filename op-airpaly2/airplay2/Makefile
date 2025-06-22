#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# updated to work with latest source from abrasive
#

include $(TOPDIR)/rules.mk

PKG_NAME:=airplay2
PKG_VERSION:=4.3.7
PKG_RELEASE:=1

PKG_SOURCE:=shairport-sync-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/mikebrady/shairport-sync/tar.gz/$(PKG_VERSION)?
PKG_HASH:=a1242d100b61fe1fffbbf706e919ed51d6a341c9fb8293fb42046e32ae2b3338

PKG_MAINTAINER:=Ted Hess <thess@kitschensync.net>, \
		Mike Brady <mikebrady@eircom.net>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING LICENSES shairport.c

PKG_BUILD_DIR:=$(BUILD_DIR)/shairport-sync-$(PKG_VERSION)

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/airplay2/default
  SECTION:=sound
  CATEGORY:=Sound
  TITLE:=AirPlay compatible audio player
  DEPENDS:=@AUDIO_SUPPORT +libpthread +alsa-lib +libconfig +libdaemon +libpopt +libplist +libsodium +libgcrypt +libffmpeg-full +libuuid +nqptp +libmosquitto
  PROVIDES:=airplay2
  URL:=https://github.com/mikebrady/shairport-sync
endef

define Package/airplay2-openssl
  $(Package/airplay2/default)
  TITLE+= (openssl)
  DEPENDS+= +libopenssl +libavahi-client +libsoxr
  VARIANT:=openssl
endef

define Package/airplay2-mbedtls
  $(Package/airplay2/default)
  TITLE+= (mbed TLS)
  DEPENDS+= +libmbedtls +libavahi-client +libsoxr
  VARIANT:=mbedtls
  DEFAULT_VARIANT:=1
endef

define Package/airplay2-mini
  $(Package/airplay2/default)
  TITLE+= (minimal)
  DEPENDS+= +libmbedtls
  VARIANT:=mini
endef

define Package/airplay2/default/description
  Shairport Sync plays audio from iTunes and AirPlay sources, including
  iOS devices, Quicktime Player and third party sources such as forkedDaapd.
  Audio played by a Shairport Sync-powered device stays synchronised with the source
  and hence with similar devices playing the same source.

  Shairport Sync does not support AirPlay video or photo streaming.
  Ensure Kernel Modules > Sound Support > kmod-sound-core is selected.
  Also select kmod-usb-audio if you want to use USB-connected sound cards.
endef
Package/airplay2-openssl/description = $(Package/airplay2/default/description)
Package/airplay2-mbedtls/description = $(Package/airplay2/default/description)

define Package/airplay2-mini/description
  $(Package/airplay2/default/description)

  Minimal version uses mbed TLS and does not include libsoxr and avahi support.
endef

TARGET_CFLAGS += -std=gnu17

CONFIGURE_ARGS += \
	--with-alsa \
	--with-libdaemon \
	--with-airplay-2 \
	--with-pipe \
	--with-mqtt-client \
	--with-metadata

ifeq ($(BUILD_VARIANT),openssl)
  CONFIGURE_ARGS+= --with-ssl=openssl
endif

ifeq ($(BUILD_VARIANT),mbedtls)
  CONFIGURE_ARGS+= --with-ssl=mbedtls
endif

ifeq ($(BUILD_VARIANT),mini)
  CONFIGURE_ARGS+= --with-ssl=mbedtls --with-tinysvcmdns
else
  CONFIGURE_ARGS+= --with-avahi --with-soxr
endif

TARGET_LDFLAGS += -Wl,--as-needed

define Package/airplay2/default/conffiles
/etc/config/airplay2
endef

Package/airplay2-openssl/conffiles = $(Package/airplay2/default/conffiles)
Package/airplay2-mbedtls/conffiles = $(Package/airplay2/default/conffiles)
Package/airplay2-mini/conffiles = $(Package/airplay2/default/conffiles)

define Package/airplay2/default/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/shairport-sync $(1)/usr/bin/airplay2
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/airplay2.init $(1)/etc/init.d/airplay2
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/airplay2.config $(1)/etc/config/airplay2
endef

Package/airplay2-openssl/install = $(Package/airplay2/default/install)
Package/airplay2-mbedtls/install = $(Package/airplay2/default/install)
Package/airplay2-mini/install = $(Package/airplay2/default/install)

$(eval $(call BuildPackage,airplay2-openssl))
$(eval $(call BuildPackage,airplay2-mbedtls))
$(eval $(call BuildPackage,airplay2-mini))
