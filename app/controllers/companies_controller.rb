class CompaniesController < ApplicationController
  
  def index
    @companies = Company.order("name").page(params[:page]).per(8)
  end

  def show

  end
end
