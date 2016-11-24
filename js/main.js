$(function() {
  $('.letter').on('mouseover', function() {
    var letter = $(this).html().toLowerCase();
    var klass = 'body-' + letter;
    var fact = '.fact-' + letter;

    $('body').removeClass().addClass(klass);
    $('.fun-fact').children().addClass('hidden');
    $(fact).removeClass('hidden');

  });

  $('.menu-link').on('click', function() {
    $('.nav-box').removeClass('hidden');
    $('body').removeClass();
    $('body').addClass('drawer-out');
  });
  
  $('#close-menu').on('click', function() {
    $('body').removeClass('');
    $('body').addClass('drawer-in');
    $('.nav-box').addClass('hidden');
  });
});
