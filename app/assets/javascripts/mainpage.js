$(document).on('turbolinks:load',function(){
  $('.contents__content__change_2--select').on('click',function(e){
    e.preventDefault();
    var doms = $(this).nextAll('.contents__content__change_2--select');
    $(doms).each(function(i,element){
      $(element).removeClass('active');
    })
    var doms = $(this).prevAll('.contents__content__change_2--select');
    $(doms).each(function(i,element){
      $(element).removeClass('active');
    })
    $(this).addClass('active');
  })
})