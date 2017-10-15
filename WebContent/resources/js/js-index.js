$(document).ready(function() {

	$("#submit-signup").click(function() {
		// do basic form validation
		
		$.ajax({
			url: 'signup',
			type: 'post',
			dataType: 'text',
			data: {"inputfirstname":$("#inputfirstname").val(),"inputlastname":$("#inputlastname").val(),"inputemail":$("#inputemail").val(),"inputpassword":$("#inputpassword").val()}, // provide data here in json
			success: function(data) {
				$("#trgt").text('You have Signed Up!');
				$("#msg").text('Login using '+data.split(':')[1]);
				$("#msg").removeClass("hidden");
				$("#inputfirstname").val('');
				$("#inputlastname").val('');
				$("#inputemail").val('');
				$("#inputpassword").val('');
				$("#repassword").val('');
			}
		});
	});
	
});