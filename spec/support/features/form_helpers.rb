module Features
	module FormHelpers
	  def submit_form
	    find('input[name="commit"]').click
	  end

	  def login(email, password)
	  	goto_login_page
	  	fill_form(nil ,{ password: password, email: email})
      submit_form
	  end

	  def login_as(user)
	  	login(user.email, user.password)
	  end
	end
end