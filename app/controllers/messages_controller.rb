class MessagesController < ApplicationController
  def create
    chat_member = ChatMember.where(user: current_user, chat_room: ChatRoom.find(params[:chat_room_id])).first
    chat_member.messages.create!(message: params[:message])
    redirect_back(fallback_location: root_path)
  end
end
