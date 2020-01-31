class MessagesController < ApplicationController
  def create
    chat_member = ChatMember.where(user: current_user, chat_room: ChatRoom.find(params[:chat_room_id])).first
    chat_member.messages.create(message_params)

    ActionCable.server.broadcast 'messages',
      message: params[:message][:message],
      username: current_user.name
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
