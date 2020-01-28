class HomePagesController < ApplicationController
  def index
    @chat_list = ChatMember.where(user: current_user).map { |chat_member| chat_member.chat_room }
  end
end
