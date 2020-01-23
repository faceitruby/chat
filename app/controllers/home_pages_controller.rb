class HomePagesController < ApplicationController
  def index
    @new_chat_room = ChatRoom.new
    @chat_list = ChatMember.where(user: current_user).map { |chat_member| chat_member.chat_room }
  end
end
