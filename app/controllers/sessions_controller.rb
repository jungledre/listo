class SessionsController < ApplicationController

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "User logged in!!"
      redirect_to root_path
    else
      flash[:error] = "Credentials Invalid!!"
      redirect_to root_path
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "User logged out!"
    redirect_to root_path
  end

end
