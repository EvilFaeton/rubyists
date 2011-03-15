class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def show
    @authentication = Authentication.find(params[:id])
  end

  def new
    @authentication = Authentication.new
  end

  def create
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      flash[:notice] = "Successfully created authentication."
      redirect_to @authentication
    else
      render :action => 'new'
    end
  end

  def edit
    @authentication = Authentication.find(params[:id])
  end

  def update
    @authentication = Authentication.find(params[:id])
    if @authentication.update_attributes(params[:authentication])
      flash[:notice] = "Successfully updated authentication."
      redirect_to authentication_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
