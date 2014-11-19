// STICKY HEADER
$(window).scroll(function () {
	if ( $(this).scrollTop() > 490 && !$('#home > .header').hasClass('open') ) {
		$('#home > .header').addClass('open');
	} else if ( $(this).scrollTop() <= 490 ) {
		$('#home > .header').removeClass('open');
	}
});

// DROPDOWN SEARCHBAR
$(document).ready(function(){
	$('.searchButton').click(function(event){
		event.preventDefault();
		$('.searchButton').toggleClass('open');
		$('.searchBar').toggleClass('open');
	});
});

$(document).ready(function(){
	$('.showButton').click(function(event){
		event.preventDefault();
		$(this).siblings('.expandedContent').toggleClass('open');
		$(this).toggleClass('open');
	});
});