$(function(){
  $('.bxslider').bxSlider({
    auto: true,
    speed: 1000,
    moveSlides: 1,
    pause: 3000,
    maxSlides: 4,
    slideWidth: 150,
    autoHover: true,
    speed: 300,
    preloadImages: 'all',
  });

  $('.image_child').on('mousedown',function(e){
    e.preventDefault();
    var src = $(this).prop('src');
    var nextDom = $(this).closest('.bx-wrapper');
    var topImage = $(nextDom).prev('.image_top');
    $(topImage).attr('src',src)
  })
})