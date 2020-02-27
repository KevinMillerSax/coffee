class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  include SessionsHelper

  #confirm a logged in user
  def logged_in_user
    unless logged_in?
      redirect_to root_url
    end
  end
end
