class SiteController < ApplicationController

  def index
    @page = "home"
    @user = current_user ? current_user : User.new

  end

  def about
    @page = "about"

  end

  def faq
    @page = "faq"

  end

end
