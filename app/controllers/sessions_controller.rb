class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated_user
  def new
    if current_user
      flash[:info] = "You are already logged in as #{current_user.email}"
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/dashboard", notice: 'Logged in'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/", notice: 'Logged out'
  end
end
