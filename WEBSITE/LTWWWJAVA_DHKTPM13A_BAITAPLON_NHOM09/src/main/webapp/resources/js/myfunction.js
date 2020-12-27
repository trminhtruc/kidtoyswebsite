$(window).scroll(function(event) {
	var scroll = $(window).scrollTop();
	var navbar = $("#asdfnavbar");
	var slide = $("#myCarousel");
	if (scroll > 80) {
		navbar.addClass("navbar-follow");
		slide.addClass("slide-padding");
	} else {
		navbar.removeClass("navbar-follow");
		slide.removeClass("slide-padding");
	}

});
window.setTimeout(function() {
	$(".alert").fadeTo(500, 0).slideUp(500, function() {
		$(this).remove();
	});
}, 2000);