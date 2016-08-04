var scroll_start = 0;
var startchange = $('.page-top');
var offset = startchange.offset();
$(document).scroll(function(){

  scroll_start = $(this).scrollTop();
  if(scroll_start > offset.top) {
    $('nav').css("background-color", "rgba(253, 253, 253, 1)");
    $('nav').css("box-shadow", "0 2px 4px rgba(0, 0, 0, 0.17)");
  }
    else {
      $('nav').css('background-color', "transparent");
      $('nav').css("box-shadow", "");
    }

})
