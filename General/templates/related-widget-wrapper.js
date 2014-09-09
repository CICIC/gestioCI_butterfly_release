	function dismissRelatedLookupPopup(win, chosenId) {
		var name = windowname_to_id(win.name);
		var elem = document.getElementById(name);
		if (elem.className.indexOf('vManyToManyRawIdAdminField') != -1 && elem.value) {
			elem.value += ',' + chosenId;
		} else {
			document.getElementById(name).value = chosenId + "WW";
		}
		win.close();
	}


(function($) {

	$(document).ready(function () {

	} )
}) (django.jQuery);