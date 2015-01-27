class ActivitiesController < ApplicationController

  before_action :is_authenticated?

  def index
    @page = "activities"
    @user = current_user
    @activities = Activity.all.order("RANDOM()").limit(3)
  end

  def add_activity
    @user = current_user
    activity = Activity.find_by_id(params[:activity_id])
    match = false
    if @user.activities.any?
      @user.activities.each do |user_act|
        if activity == user_act
          match = true
        end
      end
    end
    if !match
      @user.activities << activity
    end
    redirect_to activities_path
  end

end
