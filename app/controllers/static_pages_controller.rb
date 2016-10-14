class StaticPagesController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  
	def index
	end

	def dashboard
		@user = current_user
		@org = @user.get_member_orgs
		# @org = (Organization.where(user_id: @user.id) + 
		# 						Membership.where(user_id: @user.id).collect{ |mem|
		# 							mem.organization
		# 						}).flatten.uniq
		respond_to do |f|
			f.html
			f.json {render json: {organizations: @org}}
		end
	end
end
