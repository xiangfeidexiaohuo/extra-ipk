local m,s,o
local ov="overwall"
local uci=luci.model.uci.cursor()
run=uci:get(ov,'@global[0]','run_mode')

local server_table={}
uci:foreach(ov,"servers",function(s)
	if s.alias then
		server_table[s[".name"]]="[%s]:%s"%{string.upper(s.type),s.alias}
	elseif s.server and s.server_port then
		server_table[s[".name"]]="[%s]:%s:%s"%{string.upper(s.type),s.server,s.server_port}
	end
end)

local key_table={}
for key in pairs(server_table) do
	table.insert(key_table,key)
end
table.sort(key_table)

m=Map(ov,translate("Shunt Setting"))
s=m:section(TypedSection,"global")
s.anonymous=true

if run=='router' or run=='gfw' or run=='all' then
s:tab("yb",translate("Youtube Server"))

o=s:taboption("yb",ListValue,"yb_server",translate("Youtube Server"))
o:value("",translate("Same as Global Server"))
for _,key in pairs(key_table) do o:value(key,server_table[key]) end

o=s:taboption("yb",Flag,"yb_proxy",translate("External Proxy Mode"),
translate("Forward Youtube Proxy through Main Proxy"))
for _,key in pairs(key_table) do o:depends("yb_server",key) end

o=s:taboption("yb",ListValue,"dns_mode_y",translate("Youtube Resolve Dns Mode"))
o:value("0",translate("Use SmartDNS DoH query"))
o:value("1",translate("Use SmartDNS TCP query"))
for _,key in pairs(key_table) do o:depends("yb_server",key) end

o=s:taboption("yb",Value,"dns_yb",translate("Youtube DoH"),
translate("Do not use the same DNS server as the Foreign DNS"))
o:value("",translate("Google"))
o:value("1","Cloudflare")
o:value("3","Quad9")
o:value("4","Quad9 ECS")
o:value("5","OpenDNS")
for _,key in pairs(key_table) do o:depends({yb_server=key,dns_mode_y=0}) end

o=s:taboption("yb",Value,"tcp_dns_yb",translate("Youtube DNS"),
translate("Do not use the same DNS server as the Foreign DNS"))
o:value("","8.8.8.8,8.8.4.4 ("..translate("Google")..")")
o:value("1","1.1.1.1,1.0.0.1 (Cloudflare)")
o:value("3","9.9.9.9,149.112.112.112 (Quad9)")
o:value("4","9.9.9.11,149.112.112.11 (Quad9 ECS)")
o:value("5","208.67.222.222,208.67.220.220 (OpenDNS)")
for _,key in pairs(key_table) do o:depends({yb_server=key,dns_mode_y=1}) end

s:tab("nf",translate("Netflix Server"))

o=s:taboption("nf",ListValue,"nf_server",translate("Netflix Server"))
o:value("",translate("Same as Global Server"))
for _,key in pairs(key_table) do o:value(key,server_table[key]) end

o=s:taboption("nf",Flag,"nf_proxy",translate("External Proxy Mode"),
translate("Forward Netflix Proxy through Main Proxy"))
for _,key in pairs(key_table) do o:depends("nf_server",key) end

o=s:taboption("nf",ListValue,"dns_mode_n",translate("Netflix Resolve Dns Mode"))
o:value("0",translate("Use SmartDNS DoH query"))
o:value("1",translate("Use SmartDNS TCP query"))
for _,key in pairs(key_table) do o:depends("nf_server",key) end

o=s:taboption("nf",Value,"dns_nf",translate("Netflix DoH"),
translate("Do not use the same DNS server as the Foreign DNS or Youtube DNS"))
o:value("","Quad9")
o:value("1","Cloudflare")
o:value("2",translate("Google"))
o:value("4","Quad9 ECS")
o:value("5","OpenDNS")
for _,key in pairs(key_table) do o:depends({nf_server=key,dns_mode_n=0}) end

o=s:taboption("nf",Value,"tcp_dns_nf",translate("Netflix DNS"),
translate("Do not use the same DNS server as the Foreign DNS or Youtube DNS"))
o:value("","9.9.9.9,149.112.112.112 (Quad9)")
o:value("1","1.1.1.1,1.0.0.1 (Cloudflare)")
o:value("2","8.8.8.8,8.8.4.4 ("..translate("Google")..")")
o:value("4","9.9.9.11,149.112.112.11 (Quad9 ECS)")
o:value("5","208.67.222.222,208.67.220.220 (OpenDNS)")
for _,key in pairs(key_table) do o:depends({nf_server=key,dns_mode_n=1}) end

s:tab("cu",translate("Custom Server"))

o=s:taboption("cu",ListValue,"cu_server",translate("Custom Server"))
o:value("",translate("Same as Global Server"))
for _,key in pairs(key_table) do o:value(key,server_table[key]) end

o=s:taboption("cu",Flag,"cu_proxy",translate("External Proxy Mode"),
translate("Forward Custom Proxy through Main Proxy"))
for _,key in pairs(key_table) do o:depends("cu_server",key) end

o=s:taboption("cu",ListValue,"dns_mode_c",translate("Custom Server Resolve Dns Mode"))
o:value("0",translate("Use SmartDNS DoH query"))
o:value("1",translate("Use SmartDNS TCP query"))
for _,key in pairs(key_table) do o:depends("cu_server",key) end

o=s:taboption("cu",Value,"dns_cu",translate("Custom Server DoH"),
translate("Do not use the same DNS server as the Foreign DNS or Youtube/Netflix DNS"))
o:value("","Quad9 ECS")
o:value("1","Cloudflare")
o:value("2",translate("Google"))
o:value("3","Quad9")
o:value("5","OpenDNS")
for _,key in pairs(key_table) do o:depends({cu_server=key,dns_mode_c=0}) end

o=s:taboption("cu",Value,"tcp_dns_cu",translate("Custom Server DNS"),
translate("Do not use the same DNS server as the Foreign DNS or Youtube/Netflix DNS"))
o:value("","9.9.9.11,149.112.112.11 (Quad9 ECS)")
o:value("1","1.1.1.1,1.0.0.1 (Cloudflare)")
o:value("2","8.8.8.8,8.8.4.4 ("..translate("Google")..")")
o:value("3","9.9.9.9,149.112.112.112 (Quad9)")
o:value("5","208.67.222.222,208.67.220.220 (OpenDNS)")
for _,key in pairs(key_table) do o:depends({cu_server=key,dns_mode_c=1}) end
end

s:tab("tg",translate("Telegram Server"))

o=s:taboption("tg",ListValue,"tg_server",translate("Telegram Server"))
o:value("",translate("Same as Global Server"))
for _,key in pairs(key_table) do o:value(key,server_table[key]) end

o=s:taboption("tg",Flag,"tg_proxy",translate("External Proxy Mode"),
translate("Forward Telegram Proxy through Main Proxy"))
for _,key in pairs(key_table) do o:depends("tg_server",key) end

return m
