class ChatRoomsController < ApplicationController

  def show
    @new_chat_room = ChatRoom.new
    @new_message = Message.new

    @chat_list = ChatMember.where(user: current_user).map { |chat_member| chat_member.chat_room }
    @chat_room = ChatRoom.find(params[:id])
    @chat_members = ChatMember.where(chat_room: @chat_room)
    @chat_messages = @chat_members.find {|chat_member| Message.where(chat_member: chat_member) }
  end

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
