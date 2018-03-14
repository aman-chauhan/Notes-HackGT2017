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

	$(".note-delete-btn").click(function() {
		$.ajax({
			url : 'delete/' + $(this).data("noteid"),
			type : 'get',
			dataType : 'text',
			success : function(data) {
				location.reload(true);
			}
		});
	});

	$(".note-like-btn").click(function() {
		$.ajax({
			url : 'delete/' + $(this).data("noteid"),
			type : 'get',
			dataType : 'text',
			success : function(data) {
				location.reload(true);
			}
		});
	});
});