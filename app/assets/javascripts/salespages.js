// $(function(){
//   $('.category_parent').on('change',function(e){

//     function appendChildSelect(datas){
//       $('.category__children').remove();
//       $('.category__grand_children').remove();
//       var select =`<select class="main__content__name__text category__children" name="item[category_child_id]" id="item_category_id">
//                   </select>`
//       $('.category_area').append(select);
//       var options = `<option value="">選択してください</option>`;
//       datas.forEach(function(data){
//         var option =`<option value="${data.id}">${data.name}</option>`
//         options += option
//       })
//       $('.category__children').append(options);
//     }

//     e.preventDefault();
//     var val = $(this).val();
//     if (val !== ""){
//       $.ajax({
//         data: { category_id: val},
//         type: 'GET',
//         dataType: 'json',
//         url: '/items/ancestry_children'
//       })
//       .done(function(datas){
//         appendChildSelect(datas);
//       })
//       .fail(function(){
//         alert('通信に失敗しました');
//       })
//     }else{
//       $('.category__children').remove();
//     }
//   })

//   $('.postage_form').on('change',function(e){
//     e.preventDefault();
//     var val = $(this).val();
//     if(val == "1"){
//       $('.shipping_mean_title').show();
//       $('.shipping_mean_form').show();
//     }else{
//       $('.shipping_mean_title').hide();
//       $('.shipping_mean_form').hide();
//     }
//   })

//   $(document).on('change','.category__children',function(e){
    

//     function appendGrandChildSelect(datas){
//       $('.category__grand_children').remove();
//       var select = `<select class="main__content__name__text category__grand_children" name="item[category_grand_child_id]" id="item_category_id">
//                   </select>`
//       $('.category_area').append(select);
//       var options = `<option value="">選択してください</option>`
//       datas.forEach(function(data){
//         var option = `<option value="${data.id}">${data.name}</option>`
//         options += option;
//       })
//       $('.category__grand_children').append(options);
//     }
    
    
//     e.preventDefault();
//     var val = $(this).val();
//     if (val !== ""){
//       $.ajax({
//         data: { child_id: val},
//         type: 'GET',
//         dataType: 'json',
//         url: '/items/ancestry_grand_children'
//       })
//       .done(function(datas){
//         appendGrandChildSelect(datas);
//       })
//       .fail(function(){
//         alert('通信に失敗しました');
//       })
//     }
    
//   })

// })

$(document).on('turbolinks:load',function(){
  $('.category_parent').on('change',function(e){

    function appendChildSelect(datas){
      $('.category__children').remove();
      $('.category__grand_children').remove();
      var select =`<select class="main__content__name__text category__children" name="item[category_child_id]" id="item_category_id">
                  </select>`
      $('.category_area').append(select);
      var options = `<option value="">選択してください</option>`;
      datas.forEach(function(data){
        var option =`<option value="${data.id}">${data.name}</option>`
        options += option
      })
      $('.category__children').append(options);
    }

    e.preventDefault();
    var val = $(this).val();
    if (val !== ""){
      $.ajax({
        data: { category_id: val},
        type: 'GET',
        dataType: 'json',
        url: '/items/ancestry_children'
      })
      .done(function(datas){
        appendChildSelect(datas);
      })
      .fail(function(){
        alert('通信に失敗しました');
      })
    }else{
      $('.category__children').remove();
    }
  })

  $('.postage_form').on('change',function(e){
    e.preventDefault();
    var val = $(this).val();
    if(val == "1"){
      $('.shipping_mean_title').show();
      $('.shipping_mean_form').show();
    }else{
      $('.shipping_mean_title').hide();
      $('.shipping_mean_form').hide();
    }
  })

  $(document).on('change','.category__children',function(e){
    

    function appendGrandChildSelect(datas){
      $('.category__grand_children').remove();
      var select = `<select class="main__content__name__text category__grand_children" name="item[category_grand_child_id]" id="item_category_id">
                  </select>`
      $('.category_area').append(select);
      var options = `<option value="">選択してください</option>`
      datas.forEach(function(data){
        var option = `<option value="${data.id}">${data.name}</option>`
        options += option;
      })
      $('.category__grand_children').append(options);
    }
    
    
    e.preventDefault();
    var val = $(this).val();
    if (val !== ""){
      $.ajax({
        data: { child_id: val},
        type: 'GET',
        dataType: 'json',
        url: '/items/ancestry_grand_children'
      })
      .done(function(datas){
        appendGrandChildSelect(datas);
      })
      .fail(function(){
        alert('通信に失敗しました');
      })
    }
    
  })
})