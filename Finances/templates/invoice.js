(function($) {
	function init(){
		if ( $('#id_who_manage').val() == 1 ) {
			transfer = $('.field-transfer_date');
			if ( transfer != undefined) {
				transfer.show();
			}
			expiring = $('.field-expiring_date');
			if ( expiring != undefined) {
				expiring.show();
			}
		}else{
			transfer = $('.field-transfer_date');
			if ( transfer != undefined) {
				transfer.hide();
			}

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
