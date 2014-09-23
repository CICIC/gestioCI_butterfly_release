(function($) {

  $(document).ready(function () {

    var assist_welcome = $('.field-_has_assisted_welcome img').attr('alt');
    if(assist_welcome == 'False'){
      $('fieldset.welcome div').remove();
    }
    else if(assist_welcome == 'True'){
      $('welcome_2').removeClass('collapse collapsed');

      var assist_socialcoin = $('.field-_has_assisted_socialcoin img').attr('alt');
      var falses = $('img[alt=False]').length
      if(assist_socialcoin == 'True' && !falses){
		alert($('welcome_3'));
        $('welcome_3').removeClass('collapse collapsed');
      }

    } else {
      $('fieldset.welcome div').remove();
    }
    //alert('assist_welcome: '+assist_welcome+' ('+typeof(assist_welcome)+') falses:'+falses)

  } )
}) (django.jQuery);
