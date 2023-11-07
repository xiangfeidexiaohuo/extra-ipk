log = SimpleForm("logview")
log.submit = false
log.reset = false

t = log:field(DummyValue, '', '')
t.rawhtml = true
t.template = 'xunlei/xunlei_log'

return log