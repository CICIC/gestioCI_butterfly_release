(function($) {
	function init(){
		if ( $('#id_who_manage').val() == 1 ) {
			$('.field-status').show();
			$('.field-transfer_date').show();
			expiring = $('.field-expiring_date');
			if ( expiring != undefined) {
				expiring.show();
			}
		}else{
			$('.field-status').hide();
			$('.field-transfer_date').hide();
			expiring = $('.field-expiring_date');
			if ( expiring != undefined) {
				expiring.hide();
			}
		}
	}
	$(document).ready(function () {
		init();
		$('#id_who_manage').change(function () {
			init();
		});
	} )
}) (django.jQuery);
