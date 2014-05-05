$(document).ready(function() {
    DependentFields.bind()
		
		$('#office').change(function(){  //calls this function when the selected value changes
			if ($(this).val() == ""){
				$("#shipment_company").val("");  //sets the value of the fields to the data returned
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
			    $("#shipment_company").val("CDW");  //sets the value of the fields to the data returned
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
		
		
		
		var cdwusers = new Bloodhound({
			datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
			queryTokenizer: Bloodhound.tokenizers.whitespace,
			remote: '/users/query/%QUERY.json'
		});
 
		cdwusers.initialize();
 
		$('#cdwuser').typeahead({
			hint: true,
			highlight: true,
			minLength: 4
	 	},
		{
			name: 'displayName',
			displayKey: 'displayName',
			source: cdwusers.ttAdapter()
		});
		
		$('#cdwuser').change(function(){  //calls this function when the selected value changes
			if ($(this).val() == ""){
		    $("#shipment_sender_name").val("");  //sets the value of the fields to the data returned
		    $("#shipment_sender_email").val("");  //sets the value of the fields to the data returned
				$("#shipment_sender_phone").val("");  //sets the value of the fields to the data returned
				document.getElementById("shipment_sender_name").readOnly = false;
				document.getElementById("shipment_sender_email").readOnly = false;
				document.getElementById("shipment_sender_phone").readOnly = false;
		  }else if(($(this).val().length) < 4){
				alert("Enter at least four characters!");
				document.getElementById("shipment_sender_name").readOnly = false;
				document.getElementById("shipment_sender_email").readOnly = false;
				document.getElementById("shipment_sender_phone").readOnly = false;
			}else{
				document.getElementById("shipment_sender_name").readOnly = true;
				document.getElementById("shipment_sender_email").readOnly = true;
				document.getElementById("shipment_sender_phone").readOnly = true;
				$.get("/users/query/"+encodeURIComponent($(this).val())+".json",function(data, status, xhr){  //does ajax call to the office route asking for JSON
			    data = eval(data);  //turn the response text into a javascript object
			    $("#shipment_sender_name").val(data[0].displayName);  //sets the value of the fields to the data returned
			    $("#shipment_sender_email").val(data[0].mail);  //sets the value of the fields to the data returned
					$("#shipment_sender_phone").val(data[0].telephoneNumber);  //sets the value of the fields to the data returned
			  });
//				alert("Entered "+$(this).val().length+" characters!");
		  }		
		});
		
		
		
		
		
		
		
});


