function dismissRelatedLookupPopup(win, chosenId, newRepr) {
	var name = windowname_to_id(win.name);
	var elem = document.getElementById(name);
	dismissEditRelatedPopup(win, chosenId, newRepr);
}

function dismissEditRelatedPopup(win, objId, newRepr) {

	objId = html_unescape(objId);
	newRepr = html_unescape(newRepr);

	if ( win.name == undefined || win.name == "" ) {
		win.close()
		alert(gettext("Tens que grabar per veure els canvis"));
		return
	}

	var name = windowname_to_id(win.name).replace(/^edit_/, '');

	var elem = document.getElementById(name);

	is_many = elem.className.indexOf('vManyToManyRawIdAdminField') != -1 && elem.value;

	if ( is_many ) {

		ids_array = elem.value.split(",");
		for(var i = ids_array.length; i--;) {
			if(ids_array[i] == objId ) {
				//alert(gettext("Aquest ja està afegit!"));
				win.close();
			}
		}
		if ( elem.value) {
			elem.value += ',' + objId;
		} else {
			elem.value = objId;
		}
		var list = document.getElementById("ul_" + name);

		var lab = document.createElement ("label");
		li_name = "manytomany_" + name + "_" + objId;

		java_remove = "onclick='remove_item(window, &#39;{0}&#39;,&#39;{1}&#39;,&#39;{2}&#39;); return false;'";
		java_remove = java_remove.replace("{0}", li_name).replace("{1}", name).replace("{2}", objId);

		out_link = "<a {0} href='javascript:void;'>{1}</a>";
		out_link = out_link.replace("{0}", java_remove).replace("{1}", gettext("Treu") );

		base_path = document.getElementById("lookup_" + name ).getAttribute("href"); 
		add_url = base_path + "/add/";
		change_url = base_path + "/" + objId +  "/";
		del_url = base_path + "/" + objId +  "/delete/";

		add_link = "<a class='related-widget-wrapper-link related-widget-wrapper-add-link add-related addlink' href='";
		add_link += add_url + "' id='add_id_" + name + "' >"  + "</a>";

		change_link = "<a class='related-widget-wrapper-link related-widget-wrapper-change-link changelink' ";
		change_link += "id='edit_id_" + name + "' href='" + change_url + "'>"  + "</a>";

		del_link = "<a class='related-widget-wrapper-link related-widget-wrapper-delete-link deletelink' id='delete_id_" ;
		del_link += name + "' href='" + del_url + "'></a>";

		output = "<span name='{0}' id='{1}' value='{2}'>{3} - {4}|{5}|{6}|{7}</span>";
		output = output.replace("{0}", li_name).replace("{1}", li_name).replace("{2}", objId).replace("{3}", newRepr).replace("{4}", out_link).replace("{5}", add_link).replace("{6}", change_link).replace("{7}", del_link);

		var li = document.createElement ("LI");
		li.innerHTML = output
		list.appendChild(li);
		
	} else
	{
		java_remove = "onclick='remove_item_foreign(&#39;{0}&#39;); return false;'";
		java_remove = java_remove.replace("{0}", name);

		out_link = "<a {0} href='javascript:void;'>{1}</a>";
		out_link = out_link.replace("{0}", java_remove).replace("{1}", gettext("Treu") );

		base_path = document.getElementById("lookup_" + name ).getAttribute("href"); 
		change_url = base_path + objId +  "/";
		del_url = base_path +  objId +  "/delete/";
		java_popup = "onclick='showAddAnotherPopup(this); return false;'"
		change_link = "<a " + java_popup + " class='related-widget-wrapper-link related-widget-wrapper-change-link changelink' ";
		change_link += "id='edit_" + name + "' href='" + change_url + "'>"  + "</a>";

		del_link = "<a " + java_popup + " class='related-widget-wrapper-link related-widget-wrapper-delete-link deletelink' id='delete_" ;
		del_link += name + "' href='" + del_url + "'></a>";

		newRepr = "<p>" + newRepr + "|" + out_link + "|" + change_link +  "|" + del_link + "</p>";
		document.getElementById(name + '_desc').innerHTML = newRepr;
		document.getElementById(name).value = objId;
	}
	win.close();

};
function dismissDeleteRelatedPopup(win, obj) {
	name = win.name.replace("delete_", "");
	var elem = document.getElementById(name);

	win.close();
	if (elem.className.indexOf('vManyToManyRawIdAdminField') != -1) {
		alert("Tens que recargar la pagina");
	} else {
		document.getElementById(name + '_desc').innerHTML = "";
		document.getElementById(name).value = "";
	}

}

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

	var elem = document.getElementById(hidden_ids_inputtext_name);
	if ( elem.className.indexOf('vManyToManyRawIdAdminField') != -1 ) {
		document.getElementById(ul_li_name).parentNode.remove();
	}else {
		document.getElementById(ul_li_name).remove();
	}
	ids_array = elem.value.split(",");
	new_ids_array = [];
	for(var i = ids_array.length; i--;) {
		if(ids_array[i] != id_to_remove ) {
			new_ids_array.push(ids_array[i]);
		}
	}
	document.getElementById(hidden_ids_inputtext_name).value = new_ids_array

}

function remove_item_foreign(name){

	document.getElementById(name).value = '';
	document.getElementById(name + '_desc' ).innerHTML = gettext('(cap)');
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