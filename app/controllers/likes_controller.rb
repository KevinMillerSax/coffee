class LikesController < ApplicationController
  before_action :find_reply
  before_action :find_like , only: [:destroy]

  def create
    @reply.likes.create(user_id: current_user.id) unless already_liked?
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like.destroy unless !already_liked?
    redirect_back(fallback_location: root_path)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, reply_id: params[:reply_id]).exists?
  end

  def find_like
    @like = @reply.likes.find(params[:id])
  end

  def find_reply
    @reply = Reply.find(params[:reply_id])
  end

end
