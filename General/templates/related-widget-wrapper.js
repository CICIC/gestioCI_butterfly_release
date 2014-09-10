function dismissRelatedLookupPopup(win, chosenId, newRepr) {
	var name = windowname_to_id(win.name);
	var elem = document.getElementById(name);
	is_many = elem.className.indexOf('vManyToManyRawIdAdminField') != -1 && elem.value
	dismissEditRelatedPopup(win, chosenId, newRepr, is_many);
}

function dismissEditRelatedPopup(win, objId, newRepr, is_many=-1) {
	objId = html_unescape(objId);
	newRepr = html_unescape(newRepr);
	var name = windowname_to_id(win.name).replace(/^edit_/, '');;
	var elem = document.getElementById(name);

	if ( is_many ) {
		var ul = document.getElementById("ul_" + name);
		var li = document.createElement("li");
		li.appendChild(document.createTextNode(newRepre));
	} else
	{
		document.getElementById(name + '_desc').innerHTML = newRepr;
		document.getElementById(name).value = objId;
	}

	win.close();
};

if (!dismissAddAnotherPopup.original) {
	var originalDismissAddAnotherPopup = dismissAddAnotherPopup;
	dismissAddAnotherPopup = function(win, newId, newRepr) {
		originalDismissAddAnotherPopup(win, newId, newRepr);
		newId = html_unescape(newId);
		newRepr = html_unescape(newRepr);
		var id = windowname_to_id(win.name);
		$('#' + id).trigger('change');
	};
	dismissAddAnotherPopup.original = originalDismissAddAnotherPopup;
}

function showAddAnotherPopup(triggeringLink) {
    var name = triggeringLink.id.replace(/^add_/, '');
    name = id_to_windowname(name);
    href = triggeringLink.href
    if (href.indexOf('?') == -1) {
        href += '?_popup=1';
    } else {
        href  += '&_popup=1';
    }
    var win = window.open(href, name, 'height=800,width=800,resizable=yes,scrollbars=yes');
    win.focus();
    return false;
}

function remove_item(obj, ul_li_name, hidden_ids_inputtext_name, id_to_remove){

	document.getElementById(ul_li_name).remove();
	ids_array = document.getElementById(hidden_ids_inputtext_name).value;
	new_ids_array = [];
	for(var i = ids_array.length; i--;) {
		if(ids_array[i] != id_to_remove) {
			alert(ids_array[i]);
			new_ids_array.push(ids_array[i]);
		}
	}
	document.getElementById(hidden_ids_inputtext_name).value = new_ids_array

}

django.jQuery(document).ready(function() {
  
  var $ = $ || jQuery || django.jQuery,
  		relatedWidgetCSSSelector = '.related-widget-wrapper-change-link, .related-widget-wrapper-delete-link',
  		hrefTemplateAttr = 'data-href-template';
  
  $('.related-widget-wrapper').on('change', function(){
  	var siblings = $(this).nextAll(relatedWidgetCSSSelector);
  	if (!siblings.length) return;
  	if (this.value) {
  		var val = this.value;
  		siblings.each(function(){
  			var elm = $(this);
  			elm.attr('href', interpolate(elm.attr(hrefTemplateAttr), [val]));
  		});
  	} else siblings.removeAttr('href');
  });
	
	$('.related-widget-wrapper-link').on('click', function(){
		if (this.href) {
			return showAddAnotherPopup(this);
		} else return false;
	});
  
});