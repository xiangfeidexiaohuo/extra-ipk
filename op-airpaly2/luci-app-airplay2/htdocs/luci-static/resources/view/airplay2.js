'use strict';
'require form';
'require poll';
'require rpc';
'require uci';
'require view';

var callServiceList = rpc.declare({
	object: 'service',
	method: 'list',
	params: ['name'],
	expect: { '': {} }
});

function getServiceStatus() {
	return L.resolveDefault(callServiceList('airplay2'), {}).then(function (res) {
		var isRunning = false;
		try {
			isRunning = res['airplay2']['instances']['instance1']['running'];
		} catch (e) { }
		return isRunning;
	});
}

function renderStatus(isRunning) {
	var spanTemp = '<em><span style="color:%s"><strong>%s %s</strong></span></em>';
	var renderHTML;
	if (isRunning) {
		renderHTML = spanTemp.format('green', 'Airplay2', _('RUNNING'));
	} else {
		renderHTML = spanTemp.format('red', 'Airplay2', _('NOT RUNNING'));
	}

	return renderHTML;
}

return view.extend({
	render: function() {
		var m, s, o;

		m = new form.Map('airplay2', _('Airplay 2'),
			_('AirPlay 2 is a simple and easy-to-use AirPlay audio player.'));

		s = m.section(form.TypedSection);
		s.anonymous = true;
		s.render = function () {
			poll.add(function () {
				return L.resolveDefault(getServiceStatus()).then(function (res) {
					var view = document.getElementById('service_status');
					view.innerHTML = renderStatus(res);
				});
			});

			return E('div', { class: 'cbi-section', id: 'status_bar' }, [
					E('p', { id: 'service_status' }, _('Collecting data...'))
			]);
		}

		s = m.section(form.NamedSection, '@airplay2[0]', 'airplay2');

		o = s.option(form.Flag, 'enabled', _('Enabled'));
		o.rmempty = false;

		o = s.option(form.Value, 'name', _('Airplay Name'));
		o.rmempty = false;

		o = s.option(form.ListValue, 'interpolation', _('Interpolation'));
		o.default = 'basic';
		o.value('basic', _('Internal Basic Resampler'));
		o.value('soxr', _('High quality SoX Resampler'));

		o = s.option(form.Value, 'port', _('Port'));
		o.default = '5050';
		o.datatype = 'port';

		o = s.option(form.ListValue, 'alsa_output_device', _('Alsa Output Device'));
		o.default = '';
		o.value('', _('default'));
		o.value('hw:0', _('1st Soundcard (hw:0)'));
		o.value('hw:0,3', _('1st Soundcard 4th device (hw:0,3)'));
		o.value('hw:1', _('2nd Soundcard (hw:1)'));
		o.value('hw:2', _('3rd Soundcard (hw:2)'));

		o = s.option(form.ListValue, 'alsa_mixer_control_name', _('Alsa Mixer Control Name'));
		o.default = '';
		o.value('', _('default (software volume)'));
		o.value('PCM', _('PCM'));
		o.value('Speaker', _('Speaker'));

		o = s.option(form.ListValue, 'alsa_output_rate', _('Alsa Output Rate'));
		o.default = 'auto';
		o.value('auto', _('auto'));
		o.value('44100', _('44.1kHz'));
		o.value('88200', _('88.2kHz'));
		o.value('176400', _('176.4kHz'));
		o.value('352800', _('352.8kHz'));

		o = s.option(form.Value, 'alsa_buffer_length', _('Alsa Buffer Length'));
		o.default = '6615';

		o = s.option(form.Value, 'sesctl_session_timeout', _('Session timeout'));
		o.default = '120';

		o = s.option(form.ListValue, 'sesctl_session_interruption', _('Allow session interruption'));
		o.default = 'no';
		o.value('no', _('Not allow'));
		o.value('yes', _('Allow'));

		return m.render();
	}
});
