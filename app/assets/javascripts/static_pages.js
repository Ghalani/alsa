var dashboard;
$(document).on('ready page:change', function() {
	dashboard = new Vue({
	  el: '#orgs',
	  data: {
	    organizations: [{name:"dfjdfhdjfhdjfhdfjh"},
	    ],
	  },
	  methods:{
	  	getOrgs: function(){
	  		var that;
		    that = this;
		    $.ajax({
		      url: '/dashboard.json',
		      success: function(res) {
		        that.organizations = res.organizations;
		      }
		    });
	  	}
	  },
	  ready: function() {
	    getOrgs();
	  }
	});
	dashboard.getOrgs();
});