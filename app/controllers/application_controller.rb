class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # => protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_filter :ensure_authenticated_user

  def log_in (user)
    session[:user_id] = user.id
  end


	private
    # Pundit
    def user_not_authorized
      flash[:alert] = "Access denied."
      redirect_to (request.referrer || root_path)
    end

  	# Returns 401 if the user isn't authorized
  	def ensure_authenticated_user
      #head :unauthorized unless current_user
      if current_user && !current_user.activated
        redirect_to '/'
        flash[:info] = "Please check your email and activate your account"
      elsif !current_user
        redirect_to '/'
        flash[:info] = "Please sign in"
      end
    end

    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end

  helper_method :current_user
end
