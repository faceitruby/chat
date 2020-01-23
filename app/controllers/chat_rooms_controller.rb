class ChatRoomsController < ApplicationController
  def new
    @chat_room = ChatRoom.new
  end

  def create
    chat_room = ChatRoom.create!(chat_room_params)
    chat_room.chat_members.create(user: current_user, member_type: 'owner')
    redirect_to root_path
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :chat_type)
  end
end
