class EventsController < ApplicationController

  before_action :is_authenticated?

  def create

  end

  def show
    @page = "event"
    @activity = "Grab A Drink"
    @user = current_user
    @venues = Foursquare.get_venues 'South Lake Union, Seattle, WA', 'lunch'
    @venue = @venues[rand(0...@venues.length)]['venue']
    @venue_name = @venue['name']
    @venue_location = @venue['location']['address']

    @event = Event.find_by_id(params[:id])

    @taco = []
  end

  # def flake
  #   @nark = current_user
  #   @flaked = params[:flaked_id]
  #   @event = Event.find_by_id(params[:event_id])

  #   #if current user flakes id for event disable flakes
  #   unless @nark.flakes(where {event_id: @event.id, flaked_id: @flaked}).any?
  #     Flake.flakes << @event.flakes.create({flaked_id: @flaked, nark_id: @nark.id})
  #   else
  #     render flash alert
  #     ##send message to users alerting flake see faye
  #   end

  # end

end
