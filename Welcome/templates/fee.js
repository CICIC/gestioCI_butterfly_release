(function($) {

  $(document).ready(function () {
    var objarr = [];
    var i = 0;
    $('select#id_unit option').each(function(){
      if($(this).attr('selected')){
        ini_unid = $(this).attr('value');
        ini_unistr = $(this).text();
      };
      if($(this).attr('value') != ''){
        objarr[i] = [$(this).attr('value'), $(this).text()]
        i++
      };
    });
    //alert(objarr);

    $('select#id_payment_type option').each(function(){
      if($(this).attr('selected')){
        ini_payt = $(this).attr('value');
        ini_paytst = $(this).text();
      };
      if($(this).attr('value') != ''){
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

    $('select#id_unit').change(function(){
      $('select#id_unit option:selected').each(function(){ //always only one (unit is not multi)
        new_unid = $(this).val()

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
              $('select#id_payment_type option[vis=true]').attr('selected', true);
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
          }
        }
      });

      manage_rel_account();

    });

    $('select#id_unit').change();


    function manage_rel_account(){
      $('.field-rel_account').show();
      if ( $('#id_payment_type').val() == 22 ) { //Pagament amb criptomoneda
        $('label[for="id_rel_account"]').text(gettext("@BTC on has d'enviar el pagament"));
        id_type = "17";
      } else if( $('#id_payment_type').val() == 24 || $('#id_payment_type').val() == 25 ) { //Pagament amb Transferència Bancaria or Ingrès al banc
        $('label[for="id_rel_account"]').text(gettext("IBAN on has de fer el pagament"));
        id_type = "18";
      } else if( $('#id_payment_type').val() == 21 || $('#id_payment_type').val() == 23 || $('#id_payment_type').val() == 26 ) { // Pagament amb Hores de treball or metàl·lic or presencial
        $('.field-rel_account').hide();
      } else if($('#id_payment_type').val() == 20) { // Pagament Moneda Social
        $('label[for="id_rel_account"]').text(gettext("Comte iCES"));
        id_type = "16";
      }
      foreign_key_url = "/admin/General/record/?_popup=1&record_type__artwork_type__exact=" + id_type + "&t=id";
      $('#lookup_id_rel_account').attr('href', foreign_key_url);
    }
    //manage_rel_account();
    //$('#id_payment_type').change(function () {
    //  manage_rel_account();
    //});


  } )
}) (django.jQuery);
