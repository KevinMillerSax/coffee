class ConversationsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = current_user.conversations.new(conversation_params)
    if @conversation.save
      redirect_to conversations_url
    else
      render 'new'
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @replies = @conversation.replies.paginate(page: params[:page])
    @reply = Reply.new
  end

  private

  def conversation_params
    params.require(:conversation).permit(:content)
  end

end
