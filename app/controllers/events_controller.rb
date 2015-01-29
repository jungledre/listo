class EventsController < ApplicationController

  before_action :is_authenticated?

  def create
  end

  def show
    @page = "event"
    @user = current_user
    @event = Event.find_by_id(params[:id])
    @group = @event.users
    @activity = @event.activity

    location = @user.location || "Seattle, WA"
    category_id = @activity.category_id.split(",")
    category = category_id.first || category_id.second || category_id.third
    @venues = Foursquare.get_venues location, category
    @venue = @venues.sample
    @venue_name = @venue['name']
    @venue_location = @venue['location']['formattedAddress'].join(', ').gsub("&", "and") || ""
    @venue_map = 'https://www.google.com/maps?q=' + @venue_name + ', ' +  @venue_location
  end

  def flake
    @nark = current_user
    @flaked = params[:flaked_id]
    @event = Event.find_by_id(params[:id])
    @nark_id = @nark.id

    #if current user flakes id for event disable flakes
    unless @nark.flakes.where({event_id: @event.id, flaked_id: @flaked}).any?
      @flaked.flakes << @event.flakes.create({flaked_id: @flaked, nark_id: @nark[:id]})
    else
      render flash alert
      ##send message to users alerting flake see faye
    end

  end

end
