class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @user = current_user
  end

  def create
    @message = Message.create(message_params)
    PrivatePub.publish_to("/messages/event_#{@message.event_id}", message: @message)
  end

  private

  def message_params
    params.require(:message).permit(:event_id, :user_id, :body)
  end

end
