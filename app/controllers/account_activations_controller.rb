class AccountActivationsController < ApplicationController
  skip_before_filter :ensure_authenticated_user, only: [:edit, :activate_with_password]

  def edit
    @user = User.find_by(email: params[:email])
    
    if @user && !@user.activated? && @user.authenticated?(:activation, params[:id])
      @token = params[:id]
      if !@user.encrypted_password?
        render 'users/new_password'
      else
        @user.update_attribute(:activated,    true)
        @user.update_attribute(:activated_at, Time.zone.now)
        log_in @user
        flash[:success] = "Account activated!"
        redirect_to "/dashboard"
      end
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  def activate_with_password
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      user.update_attribute(:password,    params[:password])
      log_in user
      flash[:success] = "Password changed and Account activated!"
      redirect_to "/dashboard"
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  # private
  #   def user_param
  #     params.require(:user).permit(:password)
  #   end
end