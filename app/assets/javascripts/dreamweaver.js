$(document).on("page:change", function(){
	$('.ui.dropdown').dropdown({
		on: 'hover'
	});
	$('.menu .item').tab();
	$('.message .close').on('click', function(){
		$(this).closest('.message').fadeOut();
	});
	$('.ui.accordion').accordion();
	$('.progress').progress();
  $('#follow_button').on('click', function(){
    $('.ui.modal').modal('show');
  });
  $('.ctg').click(function(){
    $(this).siblings(".ui.modal").modal('show');
  });
  $('select.dropdown').dropdown();
});