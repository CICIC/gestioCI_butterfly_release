(function($) {
	$(document).ready(function () {
		$('#id_project_type').change(function () {
			if ( $('#id_project_type_1').filter(':checked').val() != undefined ) {
				$("#id_tent_type").show();
				$('label[for="id_tent_type_0"]').show();
				$("#id_organic").show();
				$('label[for="id_organic"]').show();
			}else{
				$("#id_tent_type").hide();
				$('label[for="id_tent_type_0"]').hide();
				$("#id_organic").hide();
				$('label[for="id_organic"]').hide();
			}
		});
		$("#id_tent_type").hide();
		$("#id_organic").hide();
		$('label[for="id_organic"]').hide();
		$('label[for="id_tent_type_0"]').hide();
	} )
}) (django.jQuery);

