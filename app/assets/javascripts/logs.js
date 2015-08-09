$(document).ready(function() {
	$('#query_fps').on("click", function(){
		$.ajax({
	        url: "/logs/" + $('#collection_collection_id').val(),
	        type: "GET",
	        dataType: "json",
	        success: function(data) {
	            $('#fps_mean').html(data["mean"])
	            $('#fps_min').html(data["min"])
	            $('#fps_max').html(data["max"])
	            $('#fps_observations').html(data["observations"])
	            $('#fps_std').html(data["std"])
	        }
	    })
	})
})

$(document).ready(function() {
	$('#act_act').on("change", function(){
		act = $(this).val()
		$("#collection_collection_id").empty()
		$('#fps_mean').empty()
		$('#fps_min').empty()
        $('#fps_max').empty()
        $('#fps_observations').empty()
        $('#fps_std').empty()
		options.forEach(function (key) {
			if (act == "") {
				$('#collection_collection_id').append('<option value="'+ key["id"] +'">'+ key["world"] +'</option>');
			} else if (key["act"] == act) {
				$('#collection_collection_id').append('<option value="'+ key["id"] +'">'+ key["world"] +'</option>');
			}
		});
	})
})

options = []
$(document).ready(function() {
	$.ajax({
        url: "/",
        type: "GET",
        dataType: "json",
        success: function(data) {
      		options = data
        }
    })
})