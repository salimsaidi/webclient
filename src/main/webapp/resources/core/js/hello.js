$(function() {

	$('.btnstb-xml').click(function (e) {
		e.preventDefault();
		var id = $("#id").val();
		if(id){

			window.location.href = "stb/xml/" + id;
		}
	});

	$('.btnstb-html').click(function (e) {
		e.preventDefault();
		var id = $("#id").val();
		if(id){

			window.location.href = "stb/html/" + id;
		}
	});

}); 