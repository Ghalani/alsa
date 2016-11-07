class StaticPagesController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  before_action :set_organization, only: [:farm_and_labour]
  
	def index
	end

	def dashboard
		@user = current_user
		@users = @user.organizations.collect{|o| o.users}.flatten
		@orgs = @user.get_member_orgs
		respond_to do |f|
			f.html
			f.json {render json: {organizations: @orgs}}
		end
	end
end
