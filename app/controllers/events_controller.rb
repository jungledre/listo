class EventsController < ApplicationController

  require 'open-uri'
  require 'json'

  def create

  end

  def show
    @page = 'event'

    response = JSON.parse(
      open('https://api.foursquare.com/v2/venues/explore?near=ballard+wa&price=1,2&client_id='+
      ENV['FOURSQUARE_KEY']+'&client_secret='+ENV['FOURSQUARE_SECRET']+'&v=20140806').read)
    @venues = response['response']['groups'].first['items']
    @venue = @venues[rand(1..@venues.length)]['venue']
    @venue_name = @venue['name']
    @venue_location = @venue['location']['address']
 end

  def flake

  end

end
