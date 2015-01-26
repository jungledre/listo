class ActivitiesController < ApplicationController

  before_action :is_authenticated?

  def index
    @page = "activities"
    @user = current_user
    activities = Activity.all
    @activity1 = activities[rand(1...activities.length)].name

    while @activity2 == @activity1
      @activity2 = activities[rand(1...activities.length)].name
    end

    while @activity3 == @activity1 || @activity3 == @activity2
      @activity3 = activities[rand(1...activities.length)].name
    end
    
  end

end
