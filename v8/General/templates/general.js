(function($) {

  $(document).ready(function () {

    $('.erase_id_on_box').click(function(){
      var arr = $(this).attr('name').split(',');
      var box = arr[0];
      var id = arr[1];
      var vals = $('#id_'+box).attr('value').split(',');
      var nvals = [];
      var i=0;
      for(var val in vals){
        if(vals[val] == id){
          //alert('val: '+vals[val])
        } else {
          nvals[i] = vals[val];
          i++
        }
      }
      $('#id_'+box).attr('value', nvals.join(','))
      $(this).parent().remove()
      $('#id_'+box).next().next('strong').remove()
      //alert('box vals:'+vals+' new vals:'+nvals.join(','));
    })
    
    /*original_dismissRelatedLookupPopup = window.dismissRelatedLookupPopup;
    window.dismissRelatedLookupPopup = function () {

      original_dismissRelatedLookupPopup.apply(this, arguments);

      $('input[name="_continue"]').click()

    };*/


  } )
}) (django.jQuery);
