class ChatRoomsController < ApplicationController
  def new
    @chat_room = ChatRoom.new
  end

  def create
    ChatRoom.create!(chat_room_params)
    redirect_to root_path
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :chat_type)
  end
end
