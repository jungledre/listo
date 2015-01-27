class EventsController < ApplicationController

  before_action :is_authenticated?

  def create

  end

  def show
    @page = 'event'
    @user = current_user
    @venues = Foursquare.get_venues 'South Lake Union, Seattle, WA', 'lunch'

    @venue = @venues[rand(0...@venues.length)]['venue']
    @venue_name = @venue['name']
    @venue_location = @venue['location']['address']
    # render :json => @venues
  end

  def flake

  end

end
