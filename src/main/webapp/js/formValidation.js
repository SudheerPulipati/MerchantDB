jQuery.validator.addMethod("phoneUS", function (phone_number, element) {
      phone_number = phone_number.replace(/\s+/g, "");
      return this.optional(element) || phone_number.length > 9 &&
      phone_number.match(/^\+[0-9][0-9]{11}$/);
  }, "Please specify a valid phone number");
$.validator.addMethod("customEmail", function(value, element) { 
    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value); 
}, "Please specify a valid email");
$(function() {
	$("#createCompanyForm").validate({
		rules : {
			companyName : {
				required : true,
				maxlength : 20
			},
			streetName : {
				required : true,
				minlength : 4,
				maxlength : 20
			},
			city : {
				required : true,
				minlength : 4,
				maxlength : 20
			},
			state : {
				required : true,
				minlength : 4,
				maxlength : 20
			},
			pinCode : {
				required : true,
				minlength : 6,
				maxlength : 6,
				number:true
			},
			email : {
				required : true,
				customEmail:true
			},
			phoneNumber : {
				required : true,
				minlength : 10,
				phoneUS:true
			},
			tinNumber : {
				required : true,
				minlength : 15,
				maxlength : 15,
				digits:true
			},
			slipsIndicator : {
				required : true,
			},

		},
		messages : {
			companyName : {
				required : "Please enter company name",
			},
			streetName : {
				required : "Please enter street name",
			},
			city : {
				required : "Please enter city name",
			},
			state : {
				required : "Please enter state name",
			},
			pinCode : {
				required : "Please enter pincode",
			},
			email : {
				required : "Please enter email",
			},
			phoneNumber : {
				required : "Please enter phone number",
			},
			tinNumber : {
				required : "Please enter TIN number",
			},
			slipsIndicator : {
				required : "Please select slipsIndicator",
			}
		
		}
	});
});