$(document).on("page:change", function(){
	$('.ui.dropdown').dropdown({
		on: 'hover'
	});
	$('.menu .item').tab();
	$('#t_progress').progress();
	$('.message .close').on('click', function(){
		$(this).closest('.message').fadeOut();
	});
});