class ActivitiesController < ApplicationController

  before_action :is_authenticated?

  def index
    @page = "activities"
    @user = current_user
  end

end
