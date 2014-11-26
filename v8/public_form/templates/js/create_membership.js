(function($) {
	function showForms(){
		/*if ( $('#id_type_0').filter(':checked').val() != undefined ) {
			$("#actions_section").html("<img src='/static/welcome_flow_FORM_akin.png'>");
		}
		if ( $('#id_type_2').filter(':checked').val() != undefined ) {
			$('#project_section').show();
		}else{
			$('#project_section').hide();
		}*/
	}
	$(document).ready(function () {
		showForms();

		$('#id_username').change(function () {
			$('#id_nickname').val( $('#id_username').val() );
		});

		$('#id_type').change(function () {
			showForms();
		});

		if ( $(".public_form_anchor").offset() == undefined ) {
			}else{
			$(document).scrollTop( $(".public_form_anchor").offset().top );
		}
		
		//$('#id_type_person').change(function () {
		//	showForms();
		//});
	} )
}) (django.jQuery);
