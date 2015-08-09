class UsersController < ApplicationController
  
  before_filter :authorize, only: [:show]

  #form for user to sign up/ create new user
  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
      render :new
    end
  end

  #creates new user in db
  def create
    if current_user
      redirect_to profile_path
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        # @user.generate_username
        redirect_to profile_path
      else
        redirect_to signup_path
      end
    end
  end

  #show current user
  def show
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end

