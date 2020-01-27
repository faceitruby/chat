class ChatRoomsController < ApplicationController
  before_action :chat_room, only: %i[show]
  before_action :chat_list, only: %i[show index]

  def show
    @chat_members = ChatMember.where(chat_room: @chat_room)
    @chat_messages = @chat_room.messages
  end

  def index
    redirect_to new_user_session_path unless user_signed_in?
    @chat_members = ChatMember.where(chat_room: @chat_room)
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    chat_room = ChatRoom.create(chat_room_params)
    chat_room.chat_members.create(user: current_user, member_type: 'owner')
    redirect_back(fallback_location: root_path)
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :chat_type)
  end

  def chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def chat_list
    @chat_list = ChatMember.where(user: current_user).map { |chat_member| chat_member.chat_room }
  end
end
