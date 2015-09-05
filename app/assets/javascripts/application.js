// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require semantic.min
//= require scrollReveal
//= require picker
//= require picker.date
//= require_tree .

$(document).ready(function(){

	window.sr = new scrollReveal();

	$('.ui.form').keydown(function(event){
    	if(event.keyCode == 13) {
      		event.preventDefault();
      		return false;
  	  	}
  	});
	
	$('.ui.form') 
	  .form({
	    first_name: {
	      identifier  : 'employee[first_name]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },
	    middle_name: {
	      identifier  : 'employee[middle_name]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },
	   	last_name: {
	      identifier  : 'employee[last_name]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },
	    email: {
	      identifier  : 'employee[email]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },
	    password: {
	      identifier  : 'employee[password]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },
	    department: {
	      identifier  : 'employee[department]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },


	    date_filed: {
	      identifier  : 'tracking_form[date_filed]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },

	    transaction_name: {
	      identifier  : 'tracking_form[transaction_name]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },

	   	prepared_by: {
	      identifier  : 'tracking_form[prepared_by]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },

	    amount_to_be_claimed: {
	      identifier  : 'tracking_form[amount_to_be_claimed]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },

	    form_remark: {
	      identifier  : 'form_remark[content]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },

	    return_notice: {
	      identifier  : 'tracking_form[return_notice]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },

	    search: {
	      identifier  : 'search',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    },

	    department_name: {
	      identifier  : 'department[name]',
	      rules: [
	        {
	          type   : 'empty',
	        }
	      ]
	    }


	})

	$('i.close.icon').on('click', function() {
  		$(this).closest('.ui.message').fadeOut();
	});

	$('.item').popup(); $('.hv').popup();
	
	$('.ui.checkbox').checkbox();
	
	$('.ui.accordion').accordion();

	$('.ui.dropdown').dropdown();

	$(".datepicker").on( "click", function() {
	  	$('.datepicker').pickadate({
  			formatSubmit: 'yyyy/mm/dd',
  			hiddenName: true,
  			today: '',
  			clear: 'Clear selection',
  			close: 'Cancel'
  		})
	});


});

