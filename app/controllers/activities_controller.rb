class ActivitiesController < ApplicationController

  before_action :is_authenticated?

  def index
    @page = "activities"
    @user = current_user
    @activities = Activity.all.order("RANDOM()").limit(3) 
  end
end
