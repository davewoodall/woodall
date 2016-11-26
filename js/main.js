$(function() {

  // DAVE actions
  $('.letter').on('mouseover', function() {
    var letter = $(this).html().toLowerCase();
    var klass = 'body-' + letter;
    var fact = '.fact-' + letter;
    $('body').removeClass().addClass(klass);
    $('.fun-fact').children().addClass('hidden');
    $(fact).removeClass('hidden');
  });

  // menu-open
  $('#menu-open').on('click', function() {
    $('body').removeClass();
    $('body').addClass('drawer-out');
  });

  // menu-close
  $('#menu-close').on('click', function() {
    $('body').removeClass('');
    $('body').addClass('drawer-in');
  });
});
