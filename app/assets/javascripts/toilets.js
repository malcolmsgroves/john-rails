// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function() {
  $toilets = $('#toilets');
  setInfiniteScroll();
});

/* Infinite Scroll */
function setInfiniteScroll() {
  if($('#infinite-scrolling').size() > 0) {
    window.onscroll = function(ev) {
      let more_posts_url = $('.pagination a.next_page').attr('href');
      if(more_posts_url && (window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        $('.loading').show();
        $.getScript(more_posts_url);
      }
    }
  }
}
