(function($) {

  $(document).ready(function () {

    original_dismissRelatedLookupPopup = window.dismissRelatedLookupPopup;
    window.dismissRelatedLookupPopup = function () {

      original_dismissRelatedLookupPopup.apply(this, arguments);

      out = '';
      for(var th in this){
        out += th+' = '+this[th]+'\n'
      }
      alert("sss");
      $('input[name="_continue"]').click()

    };
  } )
}) (django.jQuery);
