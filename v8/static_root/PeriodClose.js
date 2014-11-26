
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
			yourNumber = yourNumber.replace(".", "");
			yourNumber = yourNumber.replace(",", ".");
			return parseFloat ( yourNumber );
		}
	}
	
	function calculateVAT() {
		if ( $('#id_VAT_type').val()  == 2 ) {
			//Cooper individual VAT
			var savings = c( $('#id_Sales_invoicedVAT').val() ) - c( $('#id_Sales_assignedVAT').val() ); 
			var totalvat = $('#id_VAT_2').val();
		} else { 
			//System VAT
			var savings = 0;
			var totalvat = $('#id_VAT_1').val();
		}
		$('#id_Savings').val( ReplaceNumberWithCommas ( savings )  );
		$('#id_TotalVAT').val( totalvat );
		$('#id_TotalIRPF').val( $('#id_Purchases_IRPFRetention').val( ) );
		validateDONATION( false );
		calculateTOTALS();
	}

	function validateDONATION( showAlert ) {
		if ( showAlert==undefined){ showAlert = true; }
		if ( parseFloat( $('#id_Savings_donation').val() ) > parseFloat( $('#id_Savings').val() ) ) {
				if ( showAlert ) { alert ( gettext("La donació ha de ser menor igual que l'estalvi" )); }
				$('#id_Savings_donation').val( $('#id_Savings').val() );
		} 
	}

	function validateTAX( thisField, theOtherField, showAlert) {
		if (showAlert==undefined){ showAlert = true; }
		totalTax = c( $('#id_periodTAX').val () ) - c( $('#id_preTAX').val () ); 
		thisFieldValue = c( $(thisField).val () ); 
		theOtherFieldValue = c( $(theOtherField).val () ); 

		if ( thisFieldValue > totalTax ) {
			if ( showAlert ) { alert ( gettext("El valor no és vàlid, s'ajustarà automàticament")); }
				$(thisField).val( ReplaceNumberWithCommas( totalTax ) );
				$(theOtherField).val( 0 );
		} else {
		
			$(theOtherField).val ( ReplaceNumberWithCommas ( totalTax - thisFieldValue ) );
		}
		calculateTOTALS();
	}

	function calculateTOTALS() {
		value =  c ( $('#id_periodTAXeuro').val() ) + c( $('#id_donation_euro').val() ) + c( $('#id_Savings_donation').val() );
		$('#id_subTotalEuro').val( ReplaceNumberWithCommas ( value ) );

		value = c ( $('#id_periodTAXeco').val() ) + c ( $('#id_donation_eco').val() ) ;
		$('#id_subTotalEco').val( ReplaceNumberWithCommas ( value ) );

		value = c( $('#id_subTotalEuro').val() ) + c( $('#id_TotalIRPF').val() ) + c( $('#id_TotalVAT').val() ) ;
		$('#id_TotalEuro').val( ReplaceNumberWithCommas ( value ) );

		value = $('#id_subTotalEco').val();
		$('#id_TotalEco').val( value );
	}

	$(document).ready(function () {

		//SAVINGS
		$('#id_Savings').prop("readonly", true);

		//SUBTOTALS
		$('#id_TotalVAT').prop("readonly", true);
		$('#id_TotalIRPF').prop("readonly", true);

		calculateVAT();
		validateTAX( '#id_periodTAXeco', '#id_periodTAXeuro', true );
		$('#id_VAT_type').change(function () {
			calculateVAT();
		});
		
		$('#id_Savings_donation').change(function () {
			validateDONATION();
			calculateTOTALS();
		});

		$('#id_periodTAXeuro').change(function () {
			validateTAX( '#id_periodTAXeuro', '#id_periodTAXeco' );
		});
		
		$('#id_periodTAXeco').change(function () {
			validateTAX( '#id_periodTAXeco', '#id_periodTAXeuro' );
		});

		$('#id_donation_euro').change(function () {
			calculateTOTALS();
		});
		
		$('#id_donation_eco').change(function () {
			calculateTOTALS();
		});

		$('#id_closed').change(function () {
			if ( $('#id_closed').is(":checked")	 ) {
				var answer = confirm(gettext('Vols tancar definitivament el període?'));
				if (!answer){
					 $('#id_closed').removeAttr("checked");
				}
			}
		});


	} )


}) (django.jQuery);
