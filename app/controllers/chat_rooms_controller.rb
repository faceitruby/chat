class ChatRoomsController < ApplicationController
  before_action :check_user, only: %i[show index]
  before_action :chat_room, only: %i[show]
  before_action :chat_list, only: %i[show index]

  def show
    @chat_members = @chat_room.chat_members
    @chat_messages = @chat_room.messages.order('created_at ASC')
  end

  def index
    @chat_members = ChatMember.where(chat_room: @chat_room)
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    return unless user_signed_in?

    chat_room = ChatRoom.create(chat_room_params)
    chat_room.chat_members.create(user: current_user, member_type: 'owner')
    redirect_back(fallback_location: root_path)
  end

  private

  def check_user
    redirect_to new_user_session_path unless user_signed_in?
  end

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
