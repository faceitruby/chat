class ChatRoomsController < ApplicationController
  before_action :check_user, only: %i[show index]
  before_action :chat_room, only: %i[show]
  before_action :chat_list, only: %i[show index]

  def show
    @chat_members = @chat_room.chat_members.to_a
    @chat_messages = @chat_room.messages.order('created_at ASC').to_a
  end

  def index
    @chat_members = ChatMember.where(chat_room: @chat_room).to_a
  end

  def create
    return head 401 unless user_signed_in?

    chat_room = ChatRoom.create(chat_room_params)
    chat_room.chat_members.create(user: current_user, member_type: 'owner')
    redirect_back(fallback_location: root_path)
  end

  def search_chats
    return head 422 if params['search'].blank?

    # found will be like this:  [ [12, 'title1'], [58, 'title2'] ]
    found = ChatRoom.where('lower(title) LIKE :search and chat_type = :type',
                           search: "%#{params['search'].downcase}%", type: true)
                .pluck(:id, :title)
    found.map! { |arr| arr.join(' ') }
    render json: { found: found, search: params['search'] }
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
