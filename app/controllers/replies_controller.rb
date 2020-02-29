class RepliesController < ApplicationController

  def create
    @current_conversation = Conversation.find(reply_params[:conversation_id])
    @reply = @current_conversation.replies.new(reply_params)
    @reply.user = current_user
    if @reply.save
      flash.alert = "bingo!"
      @reply.create_activity :create, owner: current_user
      redirect_to @current_conversation
    else
      flash.alert = "you must log in to reply!"
      redirect_to @current_conversation
    end
  end


  def destroy
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :conversation_id)
  end

end
