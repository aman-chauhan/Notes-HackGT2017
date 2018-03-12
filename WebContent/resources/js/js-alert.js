$(document).ready(function() {

	$("#alertclose").click(function() {
		$.ajax({
			url : 'alertdismiss',
			type : 'get',
			dataType : 'text',
			success : function(data) {
				console.log(data);
			}
		});
	});

});