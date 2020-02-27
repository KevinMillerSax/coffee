class RepliesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @current_conversation = Conversation.find(reply_params[:conversation_id])
    @reply = @current_conversation.replies.new(reply_params)
    @reply.user = current_user
    if @reply.save
      @reply.create_activity :create, owner: current_user
      redirect_to @current_conversation
    else
      redirect_to root_url
    end
  end


  def destroy
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :conversation_id)
  end

end
