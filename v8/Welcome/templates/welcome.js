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


    $('.vForeignKeyRawIdAdminField, .vManyToManyRawIdAdminField').bind('focus blur change keyup', function(){ // keyup", function() {
      //alert('jelo')
      $('input[name="_continue"]').click()
    })

    //alert($('label.inline[text=" :"]').text())
    $('label.inline:contains(" :")').remove()
    //opener.dismissRelatedLookupPopup(window, '3'); return false;


    //$('#id_username').change(function () {
    //  $('#id_nickname').val( $('#id_username').val() );
    //});
    /*
    $('.vForeignKeyRawIdAdminField').change(function(){
      alert($(this).name)
      $.ajax("/update_fnk", {direction:"left"}).done(function (reply) {
        //$('#camerapos').empty().append(reply);
        alert("left button clicked");});

    });*/
    //$('#id_type_person').change(function () {
    //	showForms();
    //});
  } )
}) (django.jQuery);
