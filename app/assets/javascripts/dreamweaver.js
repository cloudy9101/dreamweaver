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
	$('#toggle_comment').click(function(){
		$('#comments').toggle();
	});
	$('#comments_paginate').find('a').attr("data-remote", true);
	$(".reply_toggle").click(function(){
		$(this).parent().siblings('.reply_form').toggle();
	});
});