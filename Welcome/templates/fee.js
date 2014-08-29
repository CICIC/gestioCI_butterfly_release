(function($) {

  $(document).ready(function () {

    //alert(window.location);
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

  } )
}) (django.jQuery);
