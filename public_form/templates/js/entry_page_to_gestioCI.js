(function($) {

	function roll(){
		$(document).scrollTop( $(".public_form_anchor").offset().top );
		$('input[name="username"]').focus();
	}

	function membership( val ) {
		if ( val!="None") {
			$('.public_form').show();
			$('.public_form').load('/public_form/' + val);
		}
	}
	function membership_roll( val ) {
		membership(val);
		roll();
	}

	$(document).ready(function () {
		$('#menu_iC_Akin_Membership').click( function(){membership_roll(10);});
		$('#menu_iC_Person_Membership').click( function(){membership_roll(7);});
		$('#menu_iC_Project_Membership').click( function(){membership_roll(8);});


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

		if ($('.show_create_form').val()) {
			membership( $( "#record_type_id" ).val() );
		}

		$( ".ui-tabs" ).tabs();
		$( ".ui-tabs" ).show();


	} )
}) (django.jQuery);

