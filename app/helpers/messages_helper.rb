module MessagesHelper
  def chat_member_to_name(chat_member)
    member = ChatMember.find(chat_member.id)
    member.user.name
  end
end
