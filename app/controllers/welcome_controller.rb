class WelcomeController < ApplicationController

  before_filter :has_addon

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

  def no_addon
    render text: "Looks like you still havn't installed the addon into your app. please install it and then come back to this page"
  end

  protected

  def has_addon
    if ENV['TODOSADDON_ACCESS_TOKEN'].nil? or ENV['TODOSADDON_URL'].nil?
      redirect_to no_addon_path
    end
  end

end
