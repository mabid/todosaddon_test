class WelcomeController < ApplicationController

  def index
    @todos = addon_api.index
  end

  def edit
    @todo = addon_api.show(params[:id])
  end

  def create
    addon_api.create(params[:text]) 
    redirect_to action: :index
  end

  def destroy
    addon_api.destroy(params[:id]) 
    redirect_to action: :index
  end

  def update
    addon_api.update(params[:id], params[:text]) 
    redirect_to action: :index
  end

end
