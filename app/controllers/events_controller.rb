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

    puts @flaked
    puts @event
    #if current user flakes id for event disable flakes
    if @nark.narks.where({event_id: @event, flaked_id: @flaked}).length < 1
      Event.find_by_id(@event).flakes.create({flaked_id: @flaked, nark_id: @nark[:id]})
    elsif @nark.narks.where({event_id: @event, flaked_id: @nark_id}) > 0
      @nark.events.clear
      redirect_to activites_path
    else
      redirect_to :back
      ##send message to users alerting flake see faye
    end

  end

end
