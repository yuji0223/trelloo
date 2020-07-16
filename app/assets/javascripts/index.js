$(function () {
  $('.listIcon, .addCard_link').hover(function() {
    $(this).animate({
      'font-size': '20px'}, 200);
    $(this).css('color', 'red');
  },
  function() {
    $(this).animate({
      'font-size': '18px'}, 200);
    $(this).css('color', '');
  });
});