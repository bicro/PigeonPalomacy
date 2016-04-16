$(document).ready(function() {
	console.log('clicked');
	$('.nav-link-login').click(function() {
		console.log('clicked');
		if ($('.nav-link-item-dropdown').hasClass('dropdown-active')) {
			$('.nav-link-item-dropdown').hide('fade', 300);
			$('.nav-link-item-dropdown').removeClass('dropdown-active')
		} else {
			$('.nav-link-item-dropdown').addClass('dropdown-active');
			$('.nav-link-item-dropdown').show('fade', 500);
		};
	});
});

