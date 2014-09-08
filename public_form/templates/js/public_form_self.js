(function($) {
	$(document).ready(function () {
		$('#id_project_type').change(function () {
			if ( $('#id_project_type_1').filter(':checked').val() != undefined ) {
				$("#id_tent_type").show();
			}else{
				$("#id_tent_type").hide();
			}
		});
	} )
}) (django.jQuery);

