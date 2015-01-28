class SiteController < ApplicationController

  def index
    @page = "home"
    @user = current_user ? current_user : User.new
  end

  def about
    @page = "about"
    @user = current_user ? current_user : User.new
  end

  def faq
    @page = "faq"
    @user = current_user ? current_user : User.new
  end
end
