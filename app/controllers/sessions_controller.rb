class SessionsController < ApplicationController
  
  # form to log in a user
  def new
    if current_user
      redirect_to profile_path
    else
      render :new
    end
  end

  #authenticate the user, set session
  def create
    user = User.find_by_email(user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to profile_path
    else
      redirect_to login_path
    end
  end

  #log out the current user (clear session)
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
