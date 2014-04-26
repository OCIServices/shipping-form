$(document).ready(function() {
    DependentFields.bind()
		
		$('#office').change(function(){  //calls this function when the selected value changes
			if ($(this).val() == ""){
		    $("#shipment_address1").val("");  //sets the value of the fields to the data returned
		    $("#shipment_address2").val("");  //sets the value of the fields to the data returned
				$("#shipment_address3").val("");  //sets the value of the fields to the data returned
				$("#shipment_city").val("");  //sets the value of the fields to the data returned
				$("#shipment_state").val("");  //sets the value of the fields to the data returned
				$("#shipment_zip").val("");  //sets the value of the fields to the data returned
				$("#shipment_country").val("");  //sets the value of the fields to the data returned
		  }else{
				$.get("/offices/"+$(this).val()+".json",function(data, status, xhr){  //does ajax call to the office route asking for JSON
			    data = eval(data);  //turn the response text into a javascript object
			    $("#shipment_address1").val(data.address1);  //sets the value of the fields to the data returned
			    $("#shipment_address2").val(data.address2);  //sets the value of the fields to the data returned
					$("#shipment_address3").val(data.address3);  //sets the value of the fields to the data returned
					$("#shipment_city").val(data.city);  //sets the value of the fields to the data returned
					$("#shipment_state").val(data.state);  //sets the value of the fields to the data returned
					$("#shipment_zip").val(data.zip);  //sets the value of the fields to the data returned
					$("#shipment_country").val(data.country);  //sets the value of the fields to the data returned
			  });
		  }		
		});
		
		
		
		var offices = new Bloodhound({
			datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
			queryTokenizer: Bloodhound.tokenizers.whitespace,
			remote: '/offices/query/%QUERY.json'
		});
 
		offices.initialize();
 
		$('#cdwuser').typeahead({
			hint: true,
			highlight: true,
			minLength: 1
	 	},
		{
			name: 'name',
			displayKey: 'name',
			source: offices.ttAdapter()
		});
		
		$('#cdwuser').change(function(){  //calls this function when the selected value changes
			if ($(this).val() == ""){
		    $("#shipment_sender_name").val("");  //sets the value of the fields to the data returned
		    $("#shipment_sender_email").val("");  //sets the value of the fields to the data returned
				$("#shipment_sender_phone").val("");  //sets the value of the fields to the data returned
		  }else{
				$.get("/offices/query/"+encodeURIComponent($(this).val())+".json",function(data, status, xhr){  //does ajax call to the office route asking for JSON
			    data = eval(data);  //turn the response text into a javascript object
			    $("#shipment_sender_name").val(data[0].name);  //sets the value of the fields to the data returned
			    $("#shipment_sender_email").val(data[0].city);  //sets the value of the fields to the data returned
					$("#shipment_sender_phone").val(data[0].zip);  //sets the value of the fields to the data returned
			  });
		  }		
		});
		
		
		
		
		
		
		
});


