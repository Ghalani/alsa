$(document).on('ready page:change', function() {
var dashboard = new Vue({
	  el: '#orgs',
	  data: {
	    organizations: [
	    ],
	  },
	  ready: function() {
	    var that;
	    that = this;
	    $.ajax({
	      url: '/dashboard.json',
	      success: function(res) {
	        that.organizations += res.organizations;
	      }
	    });
	  }
	});
});