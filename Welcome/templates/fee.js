(function($) {

  $(document).ready(function () {
    var objarr = [];

    var unit_ids = [];
    var i = 0;
    $('select#id_unit option').each(function(){
      if($(this).attr('selected')){
        ini_unid = $(this).attr('value');
        ini_unistr = $(this).text();
      };
      if($(this).attr('value') != ''){
        unit_ids.push($(this).attr('value'))
        objarr[i] = [$(this).attr('value'), $(this).text()]
        i++
      };
    });
    //alert(objarr);

    var ptyp_ids = [];
    $('select#id_payment_type option').each(function(){
      if($(this).attr('selected')){
        ini_payt = $(this).attr('value');
        ini_paytst = $(this).text();
      };
      if($(this).attr('value') != ''){
        ptyp_ids.push($(this).attr('value'));
        var txt = $(this).text();

        for(ob in objarr){
          if(objarr[ob][1].indexOf('Euro') > -1){
            if(txt.indexOf('Banc') > -1){
              objarr[ob][objarr[ob].length] = $(this).val();
              objarr[ob][objarr[ob].length] = txt;
            }
            if(txt.indexOf('Met') > -1){
              objarr[ob][objarr[ob].length] = $(this).val();
              objarr[ob][objarr[ob].length] = txt;
            }
          }
          else if(objarr[ob][1].indexOf('Social') > -1){
            if(txt.indexOf('Social') > -1){
              objarr[ob][objarr[ob].length] = $(this).val();
              objarr[ob][objarr[ob].length] = txt;
            }
          }
          else if(objarr[ob][1].indexOf('Cripto') > -1){
            if(txt.indexOf('Cripto') > -1){
              objarr[ob][objarr[ob].length] = $(this).val();
              objarr[ob][objarr[ob].length] = txt;
            }
          }
          else if(objarr[ob][1].indexOf('Hora') > -1){
            if(txt.indexOf('Hor') > -1){
              objarr[ob][objarr[ob].length] = $(this).val();
              objarr[ob][objarr[ob].length] = txt;
            }
          }
        }

      };
    });
    str = '';
    for(o in objarr){
      str += objarr[o]+'\n'
    }
    //alert(str);
    //alert(ptyp_ids);

    $('select#id_unit').change(function(){
      $('select#id_unit option:selected').each(function(){ //always only one (unit is not multi)
        new_unid = $(this).val()
        new_unistr = $(this).text();
        //$('select#id_payment_type option').each(function(){
        //  $(this).show();
        //}

        $('select#id_payment_type option').attr('selected',false).filter('[value=""]').remove()

        for(ob in objarr){
          if(objarr[ob][0] == new_unid){
            var opts = [];
            $('select#id_payment_type option').each(function(){
              $(this).attr('selected', false).attr('vis',false)
              var dins = false;
              for(var a=2; a<objarr[ob].length; a++){
                if($(this).val() == objarr[ob][a]){
                  dins = true;
                }
              }
              if(!dins){
                $(this).hide().attr('vis',false);
              } else {
                $(this).show().attr('vis',true);
                opts.push($(this).val());
              }
            });
            if(opts.length == 1){
              $('select#id_payment_type option').attr('selected',false);
              sel = $('select#id_payment_type option[vis=true]').attr('selected', true);
              $('select#id_payment_type').val(opts[0])
            }
            else if(opts.length == 2){
              alert('2: '+sel.length)
            }
            else if(opts.length == 3){
              $('select#id_payment_type option[vis=true]').last().attr('selected', true);
              $('select#id_payment_type').val(opts[2])
              //alert('3: '+$('select#id_payment_type option[vis=true]').length);
            }
              //$('select#id_payment_type'))
          }
        }
      });

      //alert('ini_unid: '+ini_unid+'  ini_unistr: '+ini_unistr+'  new_unid: '+new_unid+'  new_unistr: '+new_unistr);

    });

    $('select#id_unit').change();

    /*
    //alert(window.location);
    args = window.location.href.split('?')[1].split('&');
    //alert(args.length)
    if(args.length > 3){
      act = $('#fee_form').attr('action')
      but = $('input[name="_save"]');
      //alert(act)
      //act = $('#fee_form').attr('action', '?_changelist_filters=_popup%3D1%26t%3Dic_record');
      //"?_changelist_filters=_popup=1&t=ic_record")
      //$('input[name="_save"]').click()
      //alert(act)
      var op_fee_box = $('#id_join_fee', window.opener.document );
      //alert(op_fee_box.val())
    }
    */
  } )
}) (django.jQuery);
