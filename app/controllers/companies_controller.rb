class CompaniesController < ApplicationController
  
  def index
    @companies = Company.order("name").page(params[:page]).per(10)
  end

  def show

  end
end
