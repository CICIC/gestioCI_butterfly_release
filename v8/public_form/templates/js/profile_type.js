(function($) {

	$(document).ready(function () {

		if ( $( "#profile_type" ).val() == "Anon"){
			$( ".admin" ).hide();
			$( ".member" ).hide();
			$( ".anon" ).show();
		}else if ( $( "#profile_type" ).val() == "Admin"){
			$( ".admin" ).show();
			$( ".member" ).show();
		}else{
			$( ".admin" ).hide();
			$( "." + $( "#profile_type" ).val() ).show();
		}

	} )
}) (django.jQuery);

