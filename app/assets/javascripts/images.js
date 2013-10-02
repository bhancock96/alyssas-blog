$(document).ready(function(){
	$('#load_more_images').on('click', function(){
		var last_picture = $('.pictures form:last input').attr('value')
		$.get('/more_images', {last_picture: last_picture}, function(response){
			for(var i = 0; i < response.length; i ++){
				// console.log(response)
				// console.log(response[i].images.thumbnail.url)
				$('.pictures').append('<form><input type="hidden" value='+ response[i].id +'></form><img src='+ response[i].images.thumbnail.url +'>')
			}
		})
	})

	$('.add_picture').hide();
	$('#add_picture_btn').on('click', function(){
		$('.add_picture').show();
	})
})