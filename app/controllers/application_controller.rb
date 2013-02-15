class ApplicationController < ActionController::Base
  protect_from_forgery

  def addon_api
    @addon_api ||= AddonApi.new
  end
end
