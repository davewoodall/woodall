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
//    $('.nav-box').addClass('drawer-out');
    $('body').addClass('drawer-out');
  });
  
  $('#close-menu').on('click', function() {
   $('body').removeClass('drawer-out').addClass('drawer-in');
  });
});
