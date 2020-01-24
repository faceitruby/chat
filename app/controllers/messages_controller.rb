class MessagesController < ApplicationController
  def create
    chat_member = ChatMember.where(user: current_user, chat_room: ChatRoom.find(params[:chat_room_id])).first
    chat_member.messages.create(message_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
