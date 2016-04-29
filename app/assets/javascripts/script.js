var ready; ready = function() {
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
		}
	});
	$('html').click(function(){
		console.log('html')
		if ($('.nav-link-item-dropdown').hasClass('dropdown-active')) {
			$('.nav-link-item-dropdown').hide();
			$('.nav-link-item-dropdown').removeClass('dropdown-active')
		}
	});
	$(".nav-link-item-dropdown").click(function(e){
	  e.stopPropagation();
	});
	$(".nav-link-login").click(function(e){
	  e.stopPropagation();
	});

 //  setTimeout(function(){
 //  	$('.notice').remove();
	// }, 5000);

	// setTimeout(function(){
 //  	$('.alert').remove();
	// }, 5000);
}
$(document).on('page:change', ready);
