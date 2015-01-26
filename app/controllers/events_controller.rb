class EventsController < ApplicationController

  before_action :is_authenticated?

  def create

  end

  def show
    @page = 'event'
    @user = current_user
    @places = Foursquare.get_places 'Ballard wa', 'coffee'
    @place = @places[rand(0..@places.length)]['venue']
    @place_name = @place['name']
    @place_location = @place['location']['address']
  end

  def flake

  end

end
