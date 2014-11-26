(function($) {

  $(document).ready(function () {

    var assist_welcome = $('.field-_has_assisted_welcome img').attr('alt');

    if(assist_welcome == 'False'){
      $('fieldset.welcome div').remove();
    }
    else if(assist_welcome == 'True'){
      $('fieldset.welcome').first().removeClass('collapse collapsed');

      var assist_socialcoin = $('.field-_has_assisted_socialcoin img').attr('alt');
      var falses = $('img[alt=False]').length

      if(assist_socialcoin == 'False' || falses){
        $('fieldset.welcome').last().find('div').remove();
      }
      else if(assist_socialcoin == 'True' && !falses){
        first = $('fieldset.welcome').first().remove();
        last = $('fieldset.welcome').last().removeClass('collapse collapsed');
        $('fieldset.welcome').last().before(first)
      }

    } else {
      $('fieldset.welcome div').remove();
    }
	if ( $('font[alt=print_task_no]').length > 0){
		$('#print_task_list').replaceWith(gettext("Falten dades en Socis de referència, adreces o quotes."));
	}
  } )
}) (django.jQuery);
