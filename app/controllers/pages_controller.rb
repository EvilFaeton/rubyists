class PagesController < ApplicationController

  def home
  end

  def about
  end

  def faq
  end
  
  def page404
    render :action => 'page_404', :status => 404
  end

  def under_construction
  end

end