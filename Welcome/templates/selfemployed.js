(function($) {

  $(document).ready(function () {

    var assist_welcome = $('.field-_has_assisted_welcome img').attr('alt');
    if(assist_welcome == 'False'){
      $('fieldset.welcome div').remove();
    }
    else if(assist_welcome == 'True'){
      $('fieldset.welcome').first().removeClass('collapse collapsed');

      var assist_socialcoin = $('.field-_has_assisted_socialcoin img').attr('alt');
      if(assist_socialcoin == 'False'){
        $('fieldset.welcome').last().find('div').remove();
      }
      else if(assist_socialcoin == 'True'){
        $('fieldset.welcome').last().removeClass('collapse collapsed');
        $('fieldset.welcome').first().addClass('collapse');
      }

    } else {
      $('fieldset.welcome div').remove();
    }
    //alert('assist_welcome: '+assist_welcome+' ('+typeof(assist_welcome)+')')

  } )
}) (django.jQuery);
