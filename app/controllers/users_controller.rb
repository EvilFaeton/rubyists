class UsersController < ApplicationController
  
  def index
    @users = User.order("first_name").page(params[:page]).per(10)
  end
  
  def show
    @user = User.find params[:id]
  end

end