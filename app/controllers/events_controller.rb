class EventsController < ApplicationController

  before_action :is_authenticated?

  def create
  end

  def show
    @page = 'event'
    @user = current_user
    event = Event.find_by_id(params[:id])
    @group = event.users
    @activity = event.activity
    @venue_location = event.location
    @venue_name = event.venue
    @venue_map = 'https://www.google.com/maps?q=' + @venue_name + ', ' + @venue_location
    @messages = @event.messages
  end

  def flake
    @nark = current_user
    @flaked_id = params[:flaked_id]
    @event = Event.find_by_id(params[:id])

    puts @nark.id
    puts @flaked_id
    #if current user flakes id for event disable flakes
    if @nark.narks.where({event_id: @event.id, flaked_id: @flaked_id}).length < 1
      @event.flakes.create({flaked_id: @flaked_id, nark_id: @nark.id})

      if @nark.id.to_i === @flaked_id.to_i
        @nark.events.clear.where({id: @event.id})
        redirect_to dashboard_path
      else
        redirect_to :back
      end
    else
      redirect_to :back
      ##send message to users alerting flake see faye
    end


    # if @nark.narks.where({event_id: @event[:id], flaked_id: @flaked}).length < 1
    #   Event.find_by_id(@event).flakes.create({flaked_id: @flaked, nark_id: @nark[:id]})
    # elsif @nark.narks.where({event_id: @event, flaked_id: @nark_id}) > 0
    #   @nark.events.clear
    #   redirect_to activites_path
    # else
    #   redirect_to :back
    # end

  end

end
