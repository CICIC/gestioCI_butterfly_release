(function($) {
	function init(){
		alert("si");
	}
	$(document).ready(function () {
		$('#id_username').change(function () {
			$('#id_name').val( $('#id_username').val() );
		});
	} )
}) (django.jQuery);
