$(function(){
  $('#price_calc').on('input', function(){   
    var data = $('#price_calc').val(); 
    var profit = Math.round(data * 0.9)  
    var fee = (data - profit) 
    $('.main__price__box__commission__bar').html(fee) 
    $('.main__price__box__commission__bar').prepend('¥') 
    $('.main__price__box__profit__bar_2').html(profit)
    $('.main__price__box__profit__bar_2').prepend('¥')
    $('#price').val(profit) 
    if(profit == '') {   
    $('.main__price__box__profit__bar_2').html('');
    $('.main__price__box__commission__bar').html('');
    }
  })
})
