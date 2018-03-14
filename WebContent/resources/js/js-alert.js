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
		if ($(this).data("noteliked") == 0) {
			$.ajax({
				url : 'like/' + $(this).data("noteid"),
				type : 'get',
				dataType : 'text',
				success : function(data) {
					location.reload(true);
				}
			});
		} else {
			$.ajax({
				url : 'dislike/' + $(this).data("noteid"),
				type : 'get',
				dataType : 'text',
				success : function(data) {
					location.reload(true);
				}
			});
		}
	});
});