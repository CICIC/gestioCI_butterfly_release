(function($) {

	$(document).ready(function () {
		$( ".ui-tabs" ).tabs();
		var hide = $( ".ui-tabs" ).tabs( "option", "hide" );
		$(".ui-tabs").tabs(
			"option", "hide", 
			{ effect: "fold", duration:  500 }
		);
	} )

}) (django.jQuery);

