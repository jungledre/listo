class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.create(user_params)

    if @user
      session[:user_id] = @user.id
      flash[:success] = "You have been logged in!"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @page = "bio"
    @user = current_user

  end

  def edit

  end

  def update

    @user = User.find(params[:id])
    if @user.update_attribute(:location, params[:user][:location])
      redirect_to activities_path
    end

  end

  def location_change

    @user = User.find(params[:id])
    if @user.update_attribute(:location, ' ' )
      redirect_to activities_path
    end

  end

  def destroy

  end

  def dashboard
    @page = "dashboard"
    @user = current_user

  end

  def flag

  end

  private

  def user_params
    params.require(:user).permit(:email,:first_name,:last_name,:password,:password_confirmation)
  end


end
