$(function() {
  $('.letter').on('mouseover', function() {
    var letter = $(this).html().toLowerCase();
    var klass = 'body-' + letter;
    $('body').removeClass().addClass(klass);
  });
});
