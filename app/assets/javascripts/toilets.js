// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {
  setInfiniteScroll();
  setInfoClick();
});

/* Infinite Scroll */
function setInfiniteScroll() {
  if($('#infinite-scrolling').size() > 0) {
    console.log('setting');
    window.onscroll = function(ev) {
      let more_posts_url = $('.pagination a.next_page').attr('href');
      if(more_posts_url && (window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        window.onscroll = null;
        /*
        Turning off the onscroll method is a workaround, would prefer to find
        a better way to prevent double calls to the controller
        */
        $('.loading').show();
        $.getScript(more_posts_url);
      }
    }
  }
}

function setInfoClick() {
  $('#toilets').on('click', 'li', function(event) {
    let disable_current = false;
    if($(this).attr('id') === $('.active').attr('id')) {
      disable_current = true;
    }

    // remove old active classes
    $('.active').next().addClass('hidden');
    $('.active').removeClass('active');

    // add new active class
    if(!disable_current) {
      $(this).addClass('active');
      $(this).next().removeClass('hidden');
    }
  })
}
