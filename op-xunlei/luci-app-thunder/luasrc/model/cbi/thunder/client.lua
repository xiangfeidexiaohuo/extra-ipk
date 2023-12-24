local m, s

m = Map("thunder", translate("Thunder"))
m.description = translate("<a>NAS Thunder DSM 7.x Beta Version</a> | <a href=\"https://github.com/gngpp/thunder\" target=\"_blank\">Project GitHub URL</a>")

m:section(SimpleSection).template = "thunder/thunder_status"

s = m:section(TypedSection, "thunder")
s.addremove = false
s.anonymous = true

o = s:option(Flag, "enabled", translate("Enabled"))
o.rmempty = false

o = s:option(Flag, "debug", translate("Debug"))
o.rmempty = false

o = s:option(Value, "bind", translate("Bind"))
o.default = "0.0.0.0:5055"

o = s:option(Value, "auth_password", translate("Password"))
o.password = true

o = s:option(Value, "config_path", translate("Data Storage Path"), translate("Note: Please keep your user data safe"))
o.default = "/opt/thunder"

o = s:option(Value, "download_path", translate("Download Storage Path"), translate("Download the storage path, which will be mounted on the binding path after startup"))
o.default = "/opt/thunder/downloads"

o = s:option(Value, "mount_bind_download_path", translate("Mount Bind Download Path"), translate("Mount the binding path, which will be mapped to the download storage path after startup, no special default can be"))
o.default = "/thunder"

return m
