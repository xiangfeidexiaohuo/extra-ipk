local m, s

m = Map("xunlei", translate("Xunlei"))
m.description = translate("<a>NAS Xunlei DSM 7.x Beta Version</a> | <a href=\"https://github.com/gngpp/nas-xunlei\" target=\"_blank\">Project GitHub URL</a>")

m:section(SimpleSection).template = "xunlei/xunlei_status"

s = m:section(TypedSection, "xunlei")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enabled"))
o.rmempty = false

o = s:option(Flag, "debug", translate("Debug"))
o.rmempty = false

o = s:option(Value, "host", translate("Host"))
o.default = "0.0.0.0"
o.datatype = "ipaddr"

o = s:option(Value, "port", translate("Port"))
o.datatype = "and(port,min(1025))"
o.default = "5055"
o.rmempty = false

o = s:option(Value, "auth_user", translate("Username"))
o = s:option(Value, "auth_password", translate("Password"))
o.password = true

o = s:option(Value, "config_path", translate("Data Storage Path"), translate("Note: Please keep your user data safe"))
o.default = "/opt/xunlei"

o = s:option(Value, "download_path", translate("Download Storage Path"), translate("Download the storage path, which will be mounted on the binding path after startup"))
o.default = "/opt/xunlei/downloads"

o = s:option(Value, "mount_bind_download_path", translate("Mount Bind Download Path"), translate("Mount the binding path, which will be mapped to the download storage path after startup, no special default can be"))
o.default = "/xunlei"

return m
