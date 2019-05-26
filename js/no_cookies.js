(function() 
{	let get_pref = (pref_name, pref_default) => pref_name in localStorage ? JSON.parse(localStorage[pref_name]) : pref_name in sessionStorage ? JSON.parse(sessionStorage[pref_name]) : pref_default
;	let set_pref = (pref_name, pref_value, session_storage) => (session_storage ? sessionStorage : localStorage)[pref_name] = JSON.stringify(pref_value)

;	const NC = 'no_cookies'
;	let localized_strings = 
	{	'en': {message: 'This site doesn\'t use any cookies. At all!', button:'Great. I didn\'t want a cookie anyways!', explanation:'We do use “localStorage” to remember this setting though.', close:'Get rid of this rubbish'}
	,	'de': {message: 'Diese Seite verwendet keine Cookies. Überhaupt!', button:'Großartig. Ich wollte sowieso keinen Keks!', explanation:'Wir verwenden „localStorage″, um uns diese Einstellung zu merken.', close:'Werde diesen Müll los'}
	,	'nl': {message: 'Deze webstek gebruikt geen koekjes. Echt niet!', button:'Fijn, ik wil ook geen koekje!', explanation:'We gebruiken wel ❝localStorage❞ om je bevestiging te onthouden.', close:'Weg met die onzin'}
	}
;	let current_locale = navigator.language.substr(0,2)
;	const LS = localized_strings[current_locale] || localized_strings['en']
;	if (get_pref(NC, false) !== true)
	{	let no_cookies_bar = document.createElement('div')
	;   no_cookies_bar.setAttribute('class', 'no_cookies_bar')
	;	no_cookies_bar.innerHTML = '<span title="'+LS.close+'">×</span><div class="wrapper">'+LS.message+' <button title="'+LS.explanation+'">'+LS.button+'</button></div>'
	;	let h = document.querySelector('header') || document.querySelector('body')
	;	h.insertBefore(no_cookies_bar, h.childNodes[0])
	;	h.querySelector('button').addEventListener('click', function(e)
		{	set_pref(NC, true)
		;	h.removeChild(no_cookies_bar)
		})
	;	h.querySelector('span').addEventListener('click', function(e)
		{	set_pref(NC, true, true)
		;	h.removeChild(no_cookies_bar)
		})
	}
})();
