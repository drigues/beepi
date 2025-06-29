class UsersController < ApplicationController
  before_action :require_login, only: [:dashboard, :edit, :update]

  def new
    @user = User.new(directory: params[:directory])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Signup successful!"
    else
      render :new
    end
  end

  def dashboard
    @user = current_user
    #DEL @directories = current_user.directories
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_profile_params)
      redirect_to dashboard_path, notice: "Profile updated!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :directory, :password)
  end

  def user_profile_params
    params.require(:user).permit(:name, :bio, :directory)
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end
end