// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require social-share-button

$(function () {

//   function moveBackAndForth(targetElement, speed){
//     targetElement.animate({left: '+=60px'},
//   {
//     duration: speed,
//     complete: function()
//     {
//         targetElement.animate({left: '-=60px'},
//         {
//           duration: speed,
//           complete: function()
//           {
//             moveBackAndForth(targetElement, speed)
//           }
//       })
//     }
//   })
// }

function getElapsedSecondsSince(creationTime, element) {
  setInterval(function () {

        var creationDate = parseInt($(creationTime).text())
        var timeNow = Date.now() / 1000
        var timeDiff = timeNow - creationDate
        var timeDiffSecs = timeDiff;
        var secondsBetweenDates = Math.round(timeDiffSecs)
        var timeElapsed = humanizeDuration(secondsBetweenDates*1000)


        $(element).html(timeElapsed)

      }, 1000);
}

getElapsedSecondsSince('.created_at', '.timer');

  var scroll_start = 0;
  var startchange = $('.monarch-decl');
  var offset = startchange.offset();
  $(document).scroll(function(){

    scroll_start = $(this).scrollTop();
    if(scroll_start > offset.top) {
      $('nav').css("background-color", "rgba(253, 253, 253, 0.5)");
      $('nav').css("box-shadow", "0 2px 4px rgba(0, 0, 0, 0.17)");
    }
      else {
        $('nav').css('background-color', "transparent");
        $('nav').css("box-shadow", "");
      }

  })



// moveBackAndForth($('.cloud-1'), 5000)
// moveBackAndForth($('.cloud-2'), 6000)
// moveBackAndForth($('.cloud-3'), 4000)

})
