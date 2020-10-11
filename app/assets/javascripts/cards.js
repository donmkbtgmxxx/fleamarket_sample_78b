$(function() {  
  Payjp.setPublicKey('pk_test_cfa2bc17ada0dbd5284829d1');

  $('#card-registration').on('submit', function(e) {
    e.preventDefault();

    let card = {
        number: $('#card-number').val(),
        exp_month: $('#card-expire-month').val(),
        exp_year: $('#card-expire-year').val(),
        cvc: $('#card-cvc').val()
    };

    Payjp.createToken(card, function(status, response) {

      if (status === 200) {
        $('#card-number').removeAttr("name")
        $('#card-expire-month').removeAttr("name")
        $('#card-expire-year').removeAttr("name")
        $('#card-cvc').removeAttr("name")
        $('#card-registration').append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
          ); 
        $("#card-registration").get(0).submit()
        alert('カード情報が登録できました')
      } 
      else {
        alert("カード情報が正しくありません");
        $("#card-save").prop('disabled', false)
      }

    });
  });
});