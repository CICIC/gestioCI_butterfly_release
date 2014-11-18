(function($) {

$(document).ready(function () {

manage_user($('#id_ento').get(0).selectedIndex);
manage_days($('#id_notification_type').get(0).selectedIndex);

function manage_user ( ddlSelectedIndex ) {

	$(".field-sent_to_user").hide();
	if ( ddlSelectedIndex == 4 ) {
			$(".field-sent_to_user").show();
		}else{
			$(".field-sent_to_user").hide();
	}

}

function manage_days (ddlSelectedIndex){

		$(".field-offset_days").hide();
		$(".field-pointed_date").hide();

		switch ( ddlSelectedIndex ){
			//First day
			case 1:
				break
			//Days before close
			case 2:
				$(".field-offset_days").show();
				break
			//Closing day
			case 3:
				break
			//Pointed
			case 4:
				$(".field-pointed_date").show();
				break
		}	
		
}


	$('#id_ento').change(function () {
		manage_user($('#id_ento').get(0).selectedIndex);
	});

	$('#id_notification_type').change(function () {
		manage_days($('#id_notification_type').get(0).selectedIndex);
	});

} )

}) (django.jQuery);