class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound do
    redirect_to page_404_url
  end

  rescue_from ActionView::MissingTemplate do
    redirect_to under_construction_url
  end
  
end
