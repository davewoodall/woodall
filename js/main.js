$(function() {
  $('.letter').on('mouseover', function() {
    var letter = $(this).html().toLowerCase();
    var klass = 'body-' + letter;
    var fact = '.fact-' + letter;

    $('body').removeClass().addClass(klass);
    $('.fun-fact').children().addClass('hidden');
    $(fact).removeClass('hidden');

    setTimeout(function() {
      $(fact).addClass('hidden');
    }, 1000);

    setTimeout(function() {
      $('body').removeClass();
    }, 10000);
  });
  $('#close-menu').on('click', function(){
    $('.nav-box').slideUp();
  });
});
