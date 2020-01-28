class ChatMembersController < ApplicationController
  def new
    @chat_member = ChatMember.new
  end

  def create
    current_user.chat_members.create(chat_members_params)
    redirect_to root_path
  end

  private

  def chat_members_params
    params.require(:chat_member).permit(:chat_room, :member_type)
  end
end
