$(function() {
  $("ul.header__sub__leftBox__list1").hover(
    function() {
      $("ul.header__sub__leftBox__list2)", this).slideDown();
    },
    function() {
      $("ul.header__sub__leftBox__list3", this).slideUp();
    }
  );
  });