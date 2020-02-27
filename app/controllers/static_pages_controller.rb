class StaticPagesController < ApplicationController
  def home
    @activities = PublicActivity::Activity.order("created_at desc")
  end

  def about
  end

  def resources
  end
end
