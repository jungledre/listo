class ActivitiesController < ApplicationController

  before_action :is_authenticated?
  before_action :is_event

  def index
    @page = "activities"
    @user = current_user
    @activities = Activity.all.order("RANDOM()").limit(3)
  end

  def add_activity
    user = current_user
    exists = user.activities.where({id:params[:activity_id]}).any?
    activity = Activity.find_by_id(params[:activity_id])
    user.activities << activity unless exists
    location = user.location
    category_id = activity.category_id.split(',')
    category = category_id.first || category_id.second || category_id.third
    venues = Foursquare.get_venues location, category
    venue = venues.sample
    venue_name = venue['name']
    venue_location = venue['location']['formattedAddress'].join(', ').gsub('&', 'and') || ''
    group = activity.users.where(location: location)
    if group.length == 4
      event = activity.events.create({location: venue_location, venue: venue_name})
      group.each do |user|
        user.activities.clear
        user.events << event
      end
    end
    respond_to do |format|
      format.json {render json: {joined:!exists, activity:activity}}
      format.html {redirect_to activities_path}
    end
  end
end
