class ActivitiesController < ApplicationController

  before_action :is_authenticated?

  def index
    @page = "activities"
    @user = User.find_by_id(@current_user['id'])
    @activities = Activity.all.order("RANDOM()").limit(3) 
  end

  def add_activity
    @user=current_user
    @user.activites<<Activity.find_by_id(params[:id])
  end

end
