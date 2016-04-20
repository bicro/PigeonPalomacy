$(document).ready(function() {
	$('.survey').addClass('survey-active');
	$('.nav').addClass('nav-active');
	$('.nav-link-login').click(function() {
		console.log('clicked');
		if ($('.nav-link-item-dropdown').hasClass('dropdown-active')) {
			$('.nav-link-item-dropdown').hide();
			$('.nav-link-item-dropdown').removeClass('dropdown-active')
		} else {
			$('.nav-link-item-dropdown').addClass('dropdown-active');
			$('.nav-link-item-dropdown').show();
		};
	});
});

