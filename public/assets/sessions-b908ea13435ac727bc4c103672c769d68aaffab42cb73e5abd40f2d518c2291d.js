/* Simple VanillaJS to toggle class */

$(document).on('ready page:change', function() {
	// document.getElementById('toggleProfile').addEventListener('click', function () {
	//   [].map.call(document.querySelectorAll('.profile'), function(el) {
	//     el.classList.toggle('profile--open');
	//   });
	// });
	$('#toggleProfile').on('click', function(){
		init();
	});

	function init(){
		$('.profile').toggleClass('profile--open');		
	}
	init();
});
