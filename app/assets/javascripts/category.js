$(document).on('turbolinks:load',function(){

  $('.category-child').on({
    "mouseenter":function(){
    },
    "mouseleave":function(){
    }
  })

  $('.category-parent').on({
    'mouseenter' : function(){
      
      function appendChildCategories(datas){
        var childs =`<ul class="header__lower__leftBox__list2"></ul>`
        $('.header__lower__leftBox__list__categoryMenu').append(childs);
        var appendList = ``
        datas.forEach(function(data){
          var child =`<li>
                        <a class="category-child" href="/categpries/${data.id}" id="${data.id}">${data.name}</a>
                      </li>`
          appendList += child;
        })
        $('.header__lower__leftBox__list2').append(appendList);
      }
  
      var id = $(this).attr('id')
      $.ajax({
        data:{ parent_id: id},
        url: "/mainpages/ancestry_children",
        type: "GET",
        dataType: 'json'
      })
      .done(function(datas){
        appendChildCategories(datas);
      })
      .fail(function(){
        alert('通信に失敗しました')
      })

    },
    'mouseleave' : function(){
      $('.header__lower__leftBox__list2').remove();
    }
  })
})

$(document).on("mouseenter", ".category-child", function(){

  $('.category-child').on({
    'mouseenter' : function(){
    },
    'mouseleave' : function(){
    }
  })
  $('.category-child').on({
    'mouseenter' : function(){
      
      function appendChildCategories(datas){
        var grand_childs =`<ul class="header__lower__leftBox__list3"></ul>`
        $('.header__lower__leftBox__list__categoryMenu').append(grand_childs);
        var appendList = ``
        datas.forEach(function(data){
          var grand_child =`<li>
                        <a class="category-grandchild" href="/categories/${data.id}" id="${data.id}">${data.name}</a>
                      </li>`
          appendList += grand_child;
        })
        $('.header__lower__leftBox__list3').append(appendList);
      }
  
      var id = $(this).attr('id')
      $.ajax({
        data:{ child_id: id},
        url: "/mainpages/ancestry_grand_children",
        type: "GET",
        dataType: 'json'
      })
      .done(function(datas){
        appendChildCategories(datas);
      })
      .fail(function(){
        alert('通信に失敗しました')
      })

    },
    'mouseleave' : function(){
      $('.header__lower__leftBox__list3').remove();
    }
  })
})
