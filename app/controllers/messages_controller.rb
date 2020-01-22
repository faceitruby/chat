class MessagesController < ApplicationController
  def create
    chat_member = ChatMember.where(user: current_user, chat_room: ChatRoom.find(params[:chat_room])).first
    chat_member.messages.create!(message: params[:message])
  end
end
