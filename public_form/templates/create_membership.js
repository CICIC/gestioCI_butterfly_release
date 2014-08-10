(function($) {
	function showForms(){
		if ( $('#id_type_2').filter(':checked').val() != undefined ) {
			$('#project_section').show();
		}else{
			$('#project_section').hide();
		}
		if ( $('#id_type_person_1').filter(':checked').val() != undefined ) {
			$('#public_section').show();
		}else{
			$('#public_section').hide();
		}
	}
	$(document).ready(function () {
		showForms();

		$('#id_username').change(function () {
			$('#id_nickname').val( $('#id_username').val() );
		});

		$('#id_type').change(function () {
			showForms();
		});
		$('#id_type_person').change(function () {
			showForms();
		});
	} )
}) (django.jQuery);
