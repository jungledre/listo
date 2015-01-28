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

    @test = @activity.name

    @venues = Foursquare.get_venues location, 'coffee'
    @venue = @venues[rand(0...@venues.length)]['venue']
    @venue_name = @venue['name']
    @venue_location = @venue['location']['address']
  end

  # def flake
  #   @nark = current_user
  #   @flaked = params[:flaked_id]
  #   @event = Event.find_by_id(params[:event_id])

  #   #if current user flakes id for event disable flakes
  #   unless @nark.flakes.where({event_id: @event.id, flaked_id: @flaked}).any?
  #     Flake.flakes << @event.flakes.create({flaked_id: @flaked, nark_id: @nark.id})
  #   else
  #     render flash alert
  #     ##send message to users alerting flake see faye
  #   end

  # end

end
