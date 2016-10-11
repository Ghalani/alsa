module Features
	module FormHelpers
	  def submit_form
	    find('input[name="commit"]').click
	  end

	  def login
	  	fill_form(nil ,{ password: 'password', email: user.email})
      submit_form
	  end
	end
end