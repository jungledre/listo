class UsersController < ApplicationController

  before_action :is_event, only: [:dashboard]

  def new
  end

  def create
    @user = User.create(user_params)

    if @user
      session[:user_id] = @user.id
      flash[:success] = "You have been logged in!"
      redirect_to activities_path
    else
      redirect_to root_path
    end
  end

  def show
    @page = "bio"
    @user = current_user
    @show_user = User.find_by_id(params[:id])
    @score = @show_user.flake_score
  end

  def edit
  end

  def update
    @user = current_user

    if params[:user][:location]
      @user.update_attribute(:location, params[:user][:location])
      redirect_to activities_path

    elsif params[:user][:image]
      uploaded_file_path = params[:user][:image].path
      # Server Upload
      result = Cloudinary::Uploader.upload(uploaded_file_path, {:public_id => "user_"+params[:id],:invalidate => true})

      final_url = result["secure_url"]
      @user.update_attribute(:profile_img, final_url)
    end

    if params[:user][:bio]
      @user.update_attributes!({
        :bio => params[:user][:bio],
        :location => params[:user][:location]
      })

      redirect_to dashboard_path
      # render json: @user
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
    @score = @user.flake_score
    @events = @user.events
    if @user.id.to_s != params[:id].to_s
      redirect_to root_path
    end

  end

  def flag
  end

  private

  def user_params
    params.require(:user).permit(:email,:first_name,:last_name,:password,:password_confirmation)
  end
end
