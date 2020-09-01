(function ($) {
    "use strict";

    // PROJECT CAROUSEL
    $('.owl-carousel').owlCarousel({
    	items: 1,
	    loop:true,
	    margin:10,
        autoplay: true,
        smartSpeed: 1000,
	    nav:true
	});

    // TOOLTIP
    $('.social-links a').tooltip();

})(jQuery);
