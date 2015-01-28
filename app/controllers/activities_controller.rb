class ActivitiesController < ApplicationController

  before_action :is_authenticated?

  def index
    @page = "activities"
    @user = current_user
    @activities = Activity.all.order("RANDOM()").limit(3)

  end

  def add_activity
    @user = current_user
    exists = @user.activities.where({id:params[:activity_id]}).any?
    activity = Activity.find_by_id(params[:activity_id])

    @user.activities << activity unless exists

    @location = @user.location
    @group = activity.users.where(location: @location)
    if @group.length == 4
      @event = activity.events.create
      @group.each do |user|
        user.activities.clear
        user.events << @event
      end
    end

    respond_to do |format|
      format.json {render json: {joined:!exists, activity:activity}}
      format.html {redirect_to activities_path}
    end
  end
end
