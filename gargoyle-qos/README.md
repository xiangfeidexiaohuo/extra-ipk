说明：luci来源Ameykyl，其余来源immortwrt。
1、Ameykyl的luci好用，但qos-gargoyle会导致编译不成功。   https://github.com/Ameykyl/openwrt18.06。
2、immortwrt的luci会崩溃，但qos-gargoyle好用。 https://github.com/immortalwrt/immortalwrt/tree/openwrt-18.06/package/emortal
3、我自己添加李默认规则。
4、使用说明：在feeds.conf.default添加：src-git gargoyle https://github.com/iwrt/gargoyle-qos 或者
sed -i '$a src-git gargoyle https://github.com/iwrt/gargoyle-qos' feeds.conf.default
