(function($) {

  $(document).ready(function () {

    if (window.location.href.split('?').length > 1 ) {
		args = window.location.href.split('?')[1].split('&');
		//alert(args.length)
		if(args.length > 3){
		  act = $('#fee_form').attr('action')
		  but = $('input[name="_save"]');
		  //alert(act)
		  act = $('#fee_form').attr('action', '?_changelist_filters=_popup%3D1%26t%3Dic_record');
		  //"?_changelist_filters=_popup=1&t=ic_record")
		  //$('input[name="_save"]').click()
		  //alert(act)
		  var op_fee_box = $('#id_join_fee', window.opener.document );
		  //alert(op_fee_box.val())
		}
	}
	/*
		<option value="22">--- pagament amb Criptomoneda</option>
		<option value="24">--- pagament per Transferència Bancària</option>
		<option value="25">--- pagament fent Ingrés al Banc</option>
		<option value="26">--- pagament presencial (face-to-face)</option>
		<option value="20">------ pagament en Moneda Social</option>
		<option value="23">------ pagament en Metàl·lic</option>
		<option value="21">------ pagament amb Hores de Treball</option>
	*/
	function manage_rel_account(){
		$('.field-rel_account').show();
		if ( $('#id_payment_type').val() == 22 ) { //Pagament amb criptomoneda
			$('label[for="id_rel_account"]').text(gettext("@BTC on has d'enviar el pagament"));
			id_type = "17";
		} else if( $('#id_payment_type').val() == 24 || $('#id_payment_type').val() == 25 ) { //Pagament amb Transferència Bancaria or Ingrès al banc
			$('label[for="id_rel_account"]').text(gettext("IBAN on has de fer el pagament"));
			id_type = "18";
		} else if( $('#id_payment_type').val() == 21 || $('#id_payment_type').val() == 23 || $('#id_payment_type').val() == 26  ) { // Pagament amb Hores de treball or metàl·lic or presencial
			$('.field-rel_account').hide();
		} else if($('#id_payment_type').val() == 20) { // Pagament Moneda Social
			$('label[for="id_rel_account"]').text(gettext("Comte iCES"));
			id_type = "16";
		}
		foreign_key_url = "/admin/General/record/?_popup=1&record_type__artwork_type__exact=" + id_type + "&t=id";
		$('#lookup_id_rel_account').attr('href', foreign_key_url);
	}
	manage_rel_account();
	$('#id_payment_type').change(function () {
		manage_rel_account();
    });
  } )
}) (django.jQuery);
