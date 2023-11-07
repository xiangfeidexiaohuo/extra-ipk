local sys  = require "luci.sys"
local http = require "luci.http"

module("luci.controller.xunlei", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/xunlei") then
		return
	end

	local page
	page = entry({ "admin", "nas", "xunlei" }, alias("admin", "nas", "xunlei", "client"), _("Xunlei"), 10)
	page.dependent = true
	page.acl_depends = { "luci-app-xunlei" }

	entry({ "admin", "nas", "xunlei", "client" }, cbi("xunlei/client"), _("Settings"), 10).leaf = true
	entry({ "admin", "nas", "xunlei", "log" }, form("xunlei/log"), _("Log"), 30).leaf = true
	
	entry({"admin", "nas", "xunlei", "status"}, call("act_status")).leaf = true
	entry({ "admin", "nas", "xunlei", "logtail" }, call("action_logtail")).leaf = true
end

function act_status()
	local e = {}
	e.running = sys.call("pgrep -f xunlei >/dev/null") == 0
	e.application = luci.sys.exec("xunlei --version")
	http.prepare_content("application/json")
	http.write_json(e)
end

function action_logtail()
	local fs = require "nixio.fs"
	local log_path = "/var/log/xunlei.log"
	local e = {}
	e.running = luci.sys.call("pidof xunlei >/dev/null") == 0
	if fs.access(log_path) then
		e.log = luci.sys.exec("tail -n 100 %s | sed 's/\\x1b\\[[0-9;]*m//g'" % log_path)
	else
		e.log = ""
	end
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end