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
  $('#follow').on('click', function(){
    $('.ui.modal').modal('show');
  });
});