module Features
	module RouteHelpers
		def goto_login_page
			visit new_session_path
		end

		def goto_dashboard
	  	visit '/dashboard'
	  end
	end
end