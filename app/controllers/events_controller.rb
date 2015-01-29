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

    location = @user.location
    category_id = @activity.category_id

    @venues = Foursquare.get_venues location, ['4d4b7105d754a06378d81259', '4bf58dd8d48988d103951735']
    @venue = @venues.sample
    @venue_name = @venue['name']
    @venue_location = @venue['location']['address']
    puts @venue
    # @venue_map = 'https://www.google.com/maps/place/' +@venue_name + ', ' +  @venue_location + ', Seattle, WA'

  end

  def flake
    @nark = current_user
    @flaked = params[:flaked_id]
    @event = Event.find_by_id(params[:id])

    #if current user flakes id for event disable flakes
    unless @nark.flakes.where({event_id: @event.id, flaked_id: @flaked}).any?
      @flaked.flakes << @event.flakes.create({flaked_id: @flaked, nark_id: @nark[:id]})
    else
      render flash alert
      ##send message to users alerting flake see faye
    end

  end

end
