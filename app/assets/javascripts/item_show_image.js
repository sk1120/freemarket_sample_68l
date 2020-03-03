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

  $('.delete_click').on('click',function(e){
    e.preventDefault();
    e.stopImmediatePropagation(); 
    
    var url = $(this).attr('href');
    var type = $(this).attr('data-method');
    // $.ajax({
    //   url: url,
    //   type: type,
    //   data: ,
    //   dataType: 'json'
    // })
    console.log(url)
    console.log(type)



  })
})