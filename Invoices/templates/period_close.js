
(function($) {

	function ReplaceNumberWithCommas(yourNumber) {
		yourNumber = parseFloat ( yourNumber ).toFixed(2);
		//Seperates the components of the number
		var n= yourNumber.toString().split(".");
		//Comma-fies the first part
		n[0] = n[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
		//Combines the two sections
		return n.join(",");
	}

	function c(yourNumber) {
		if ( yourNumber == undefined  ) {
			return 0
		} else {
			if (yourNumber.replace(",","") == yourNumber){
				return yourNumber
			}

			yourNumber = yourNumber.replace(".", "");
			yourNumber = yourNumber.replace(",", ".");
			return parseFloat ( yourNumber );
		}
	}
	
	function calculateVAT() {
		if ( $('#id_vat_type').val()  == 0 ) {
			//Cooper individual VAT
			var savings =  $('#id_sales_invoiced_vat').val()  -  $('#id_sales_assigned_vat').val(); 
			if ( savings < 0 ){
				savings = 0;
			}
			var totalvat = $('#id_oficial_vat_total').val();
		} else { 
			//System VAT
			var savings = 0;
			var totalvat = $('#id_assigned_vat_total').val();
		}

		$('#id_savings_with_assigned_vat').val( ReplaceNumberWithCommas ( savings )  );
		$('#id_savings_with_assigned_vat').val( c($('#id_savings_with_assigned_vat').val() ) );
		$('#id_total_vat').val( totalvat );
		$('#id_total_irpf').val( $('#id_purchases_irpf').val( ) );
		validateDONATION( false );
		calculateTOTALS();
	}

	function validateDONATION( showAlert ) {
		if ( showAlert==undefined){ showAlert = true; }
		if ( parseFloat( $('#id_savings_with_assigned_vat_donation').val() ) > parseFloat( $('#id_savings_with_assigned_vat').val() ) ) {
				if ( showAlert ) { alert ( gettext("La donació ha de ser menor igual que l'estalvi" )); }
				$('#id_savings_with_assigned_vat_donation').val( $('#id_savings_with_assigned_vat').val() );
		} 
	}


	function calculateTOTALS() {
		value =  $('#id_period_tax').val()  - $('#id_advanced_tax').val()  + parseFloat( $('#id_donation').val() ) + parseFloat( $('#id_savings_with_assigned_vat_donation').val() );
		$('#id_total').val( value.toFixed(2) );
		value = parseFloat( $('#id_total_irpf').val() ) + parseFloat( $('#id_total').val() ) + parseFloat( $('#id_total_vat').val() );
		$('#id_total_to_pay').val( parseFloat(value).toFixed(2) );


	}

	$(document).ready(function () {
		//SAVINGS
		$('#id_savings_with_assigned_vat').prop("readonly", true);

		//SUBTOTALS
		$('#id_total_vat').prop("readonly", true);
		$('#id_total_irpf').prop("readonly", true);

		calculateVAT();

		$('#id_vat_type').change(function () {
			calculateVAT();
		});
		
		$('#id_savings_with_assigned_vat_donation').change(function () {
			validateDONATION();
			calculateTOTALS();
		});

		$('#id_donation').change(function () {
			calculateTOTALS();
		});
		
		$('#id_closed').change(function () {
			if ( $('#id_closed').is(":checked")) {
				var answer = confirm(gettext('Vols tancar definitivament el període?'));
				if (!answer){
					 $('#id_closed').removeAttr("checked");
				}
			}
		});


	} )


}) (django.jQuery);
