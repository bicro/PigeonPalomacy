$(document).ready(function() {
	console.log('js')
	$('.survey').addClass('survey-active');
	console.log('nav');

	$('.nav').addClass('nav-active');
	$('.nav-link-login').click(function() {
		console.log('clicked');
		if ($('.nav-link-item-dropdown').hasClass('dropdown-active')) {
			$('.nav-link-item-dropdown').hide();
			$('.nav-link-item-dropdown').removeClass('dropdown-active')
		} else {
			$('.nav-link-item-dropdown').addClass('dropdown-active');
			$('.nav-link-item-dropdown').show();
		}
	});
});

$(document).change(function() {
	$('.nav').addClass('nav-active');
});	
