class SiteController < ApplicationController

  def index
    @page = "home"

  end

  def about
    @page = "about"

  end

  def faq
    @page = "faq"

  end

end
